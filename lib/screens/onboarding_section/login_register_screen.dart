import 'package:ai_vaidya/core/constant/app_color.dart';
import 'package:ai_vaidya/widgets/custom_button.dart';
import 'package:ai_vaidya/widgets/custom_text.dart';
import 'package:ai_vaidya/widgets/main_navigation_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginRegisterScreen extends StatefulWidget {
  const LoginRegisterScreen({super.key});

  @override
  State<LoginRegisterScreen> createState() => _LoginRegisterScreenState();
}

class _LoginRegisterScreenState extends State<LoginRegisterScreen>
    with SingleTickerProviderStateMixin {
  final mobileController = TextEditingController();
  final passwordController = TextEditingController();

  bool isLogin = true;
  bool hidePassword = true;

  late final AnimationController animationController;
  late final Animation<double> fadeAnimation;
  late final Animation<Offset> slideAnimation;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    fadeAnimation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeOut,
    );

    slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.08),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeOutCubic,
      ),
    );

    animationController.forward();
  }

  @override
  void dispose() {
    mobileController.dispose();
    passwordController.dispose();
    animationController.dispose();
    super.dispose();
  }

  void submit() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const MainNavigationScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffDDF1FF),
      body: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0.18,
              child: Icon(
                Icons.medical_services_rounded,
                size: 520.sp,
                color: AppColors.primary,
              ),
            ),
          ),

          Positioned(
            top: 120.h,
            right: -70.w,
            child: _SoftCircle(size: 180.r),
          ),

          Positioned(
            bottom: 90.h,
            left: -80.w,
            child: _SoftCircle(size: 220.r),
          ),

          SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(16.w, 18.h, 16.w, 28.h),
              child: FadeTransition(
                opacity: fadeAnimation,
                child: SlideTransition(
                  position: slideAnimation,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Icon(
                          Icons.arrow_back_rounded,
                          color: AppColors.textPrimary,
                          size: 30.sp,
                        ),
                      ),

                      SizedBox(height: 25.h),

                      CustomText(
                        text: 'Welcome Back!',
                        color: AppColors.textPrimary,
                        fontSize: 34.sp,
                        fontWeight: FontWeight.w700,
                      ),

                      SizedBox(height: 38.h),

                      _AuthToggle(
                        isLogin: isLogin,
                        onChanged: (value) {
                          setState(() {
                            isLogin = value;
                          });
                        },
                      ),

                      SizedBox(height: 34.h),

                      _Label(text: 'Mobile Number'),

                      SizedBox(height: 12.h),

                      _InputField(
                        controller: mobileController,
                        hint: 'Enter your mobile number',
                        icon: Icons.phone_outlined,
                        keyboardType: TextInputType.phone,
                      ),

                      SizedBox(height: 24.h),

                      _Label(text: 'Password'),

                      SizedBox(height: 12.h),

                      _InputField(
                        controller: passwordController,
                        hint: 'Enter your password',
                        icon: Icons.lock_outline_rounded,
                        obscureText: hidePassword,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              hidePassword = !hidePassword;
                            });
                          },
                          child: Icon(
                            hidePassword
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: AppColors.textSecondary,
                            size: 22.sp,
                          ),
                        ),
                      ),

                      SizedBox(height: 14.h),

                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {},
                          child: CustomText(
                            text: 'Forget Password?',
                            color: AppColors.textPrimary,
                            fontSize: 14.5.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),

                      SizedBox(height: 38.h),

                      CustomButton(
                        text: isLogin ? 'Login' : 'Register',
                        onTap: submit,
                        height: 58.h,
                        borderRadius: 28.r,
                      ),

                      SizedBox(height: 22.h),

                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 58.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.85),
                            borderRadius: BorderRadius.circular(28.r),
                            border: Border.all(
                              color: AppColors.primary.withOpacity(0.35),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.primary.withOpacity(0.10),
                                blurRadius: 14,
                                offset: const Offset(0, 6),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(
                                text: 'G',
                                color: Colors.red,
                                fontSize: 24.sp,
                                fontWeight: FontWeight.w700,
                              ),
                              SizedBox(width: 14.w),
                              CustomText(
                                text: 'Continue with Google',
                                color: AppColors.textPrimary,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AuthToggle extends StatelessWidget {
  final bool isLogin;
  final ValueChanged<bool> onChanged;

  const _AuthToggle({
    required this.isLogin,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54.h,
      padding: EdgeInsets.all(5.w),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.55),
        borderRadius: BorderRadius.circular(28.r),
      ),
      child: Row(
        children: [
          _ToggleItem(
            title: 'Login',
            selected: isLogin,
            onTap: () => onChanged(true),
          ),
          _ToggleItem(
            title: 'Register',
            selected: !isLogin,
            onTap: () => onChanged(false),
          ),
        ],
      ),
    );
  }
}

class _ToggleItem extends StatelessWidget {
  final String title;
  final bool selected;
  final VoidCallback onTap;

  const _ToggleItem({
    required this.title,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          height: double.infinity,
          decoration: BoxDecoration(
            color: selected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(24.r),
            boxShadow: selected
                ? [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.07),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ]
                : [],
          ),
          child: Center(
            child: CustomText(
              text: title,
              color: AppColors.textPrimary,
              fontSize: 15.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}

class _Label extends StatelessWidget {
  final String text;

  const _Label({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return CustomText(
      text: text,
      color: AppColors.textPrimary,
      fontSize: 16.sp,
      fontWeight: FontWeight.w600,
    );
  }
}

class _InputField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final IconData icon;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextInputType? keyboardType;

  const _InputField({
    required this.controller,
    required this.hint,
    required this.icon,
    this.suffixIcon,
    this.obscureText = false,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58.h,
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.75),
        borderRadius: BorderRadius.circular(28.r),
        border: Border.all(
          color: AppColors.primary,
          width: 1.2,
        ),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: AppColors.primary,
            size: 22.sp,
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: TextField(
              controller: controller,
              obscureText: obscureText,
              keyboardType: keyboardType,
              style: TextStyle(
                fontFamily: 'Poppins',
                color: AppColors.textPrimary,
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
              ),
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: TextStyle(
                  fontFamily: 'Poppins',
                  color: AppColors.textSecondary.withOpacity(0.70),
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          if (suffixIcon != null) suffixIcon!,
        ],
      ),
    );
  }
}

class _SoftCircle extends StatelessWidget {
  final double size;

  const _SoftCircle({
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.35),
        shape: BoxShape.circle,
      ),
    );
  }
}