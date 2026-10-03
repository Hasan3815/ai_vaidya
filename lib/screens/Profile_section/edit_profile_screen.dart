import 'package:ai_vaidya/core/constant/app_color.dart';
import 'package:ai_vaidya/providers/profile_provider.dart';
import 'package:ai_vaidya/widgets/animated_wave.dart';
import 'package:ai_vaidya/widgets/custom_animated_bubble.dart';
import 'package:ai_vaidya/widgets/custom_button.dart';
import 'package:ai_vaidya/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final nameController = TextEditingController(text: 'Alex Doe');
  final usernameController = TextEditingController(text: '@alex_doe');
  final bioController = TextEditingController();
  final emailController = TextEditingController(text: 'alex.doe@example.com');
  final phoneController = TextEditingController();
  final dobController = TextEditingController();

  @override
void initState() {
  super.initState();

  Future.microtask(() {
    final profileProvider = context.read<ProfileProvider>();

    nameController.text = profileProvider.name;
    usernameController.text = profileProvider.username;
    bioController.text = profileProvider.bio;
    emailController.text = profileProvider.email;
  });
}

  @override
  void dispose() {
    nameController.dispose();
    usernameController.dispose();
    bioController.dispose();
    emailController.dispose();
    phoneController.dispose();
    dobController.dispose();
    super.dispose();
  }

  Future<void> pickDate() async {
    final date = await showDatePicker(
      context: context,
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
      initialDate: DateTime(2000),
    );

    if (date == null) return;

    dobController.text = '${date.month}/${date.day}/${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          const _EditProfileHeader(),

          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(16.w, 24.h, 16.w, 24.h),
              child: Column(
                children: [
                  _ProfileImagePicker(),

                  SizedBox(height: 28.h),

                  _ProfileInput(
                    label: 'Full Name',
                    controller: nameController,
                    hint: 'Enter full name',
                    icon: Icons.person_outline_rounded,
                  ),

                  _ProfileInput(
                    label: 'Username',
                    controller: usernameController,
                    hint: 'Enter username',
                    icon: Icons.alternate_email_rounded,
                  ),

                  _ProfileInput(
                    label: 'Short Bio',
                    controller: bioController,
                    hint: 'Tell us about yourself',
                    icon: Icons.notes_rounded,
                    height: 130.h,
                    maxLines: 4,
                  ),

                  _ProfileInput(
                    label: 'Email Address',
                    controller: emailController,
                    hint: 'Enter email address',
                    icon: Icons.email_outlined,
                  ),

                  _ProfileInput(
                    label: 'Phone Number',
                    controller: phoneController,
                    hint: '(123) 456-7890',
                    icon: Icons.phone_outlined,
                    keyboardType: TextInputType.phone,
                  ),

                  _ProfileInput(
                    label: 'Date of Birth',
                    controller: dobController,
                    hint: 'MM/DD/YYYY',
                    icon: Icons.calendar_month_rounded,
                    readOnly: true,
                    onTap: pickDate,
                  ),

                  SizedBox(height: 24.h),

                  CustomButton(
  text: 'Save Changes',
  onTap: () {
    context.read<ProfileProvider>().updateProfile(
          newName: nameController.text.trim(),
          newEmail: emailController.text.trim(),
          newAge: '28',
          newUsername: usernameController.text.trim(),
          newBio: bioController.text.trim(),
        );

    Navigator.pop(context);
  },
  height: 58.h,
  borderRadius: 30.r,
),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _EditProfileHeader extends StatelessWidget {
  const _EditProfileHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.h,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: AppColors.primaryGradient,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(28.r),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(28.r),
        ),
        child: Stack(
          children: [
            CustomAnimatedBubble(
              size: 90.r,
              left: 15.w,
              top: 35.h,
              color: Colors.white.withOpacity(0.12),
              duration: const Duration(seconds: 4),
            ),
            CustomAnimatedBubble(
              size: 55.r,
              left: 300.w,
              top: 45.h,
              color: Colors.white.withOpacity(0.15),
              duration: const Duration(seconds: 3),
            ),
            Positioned(
              bottom: -45.h,
              left: 0,
              right: 0,
              child: AnimatedWave(
                color: Colors.white.withOpacity(0.15),
                height: 85.h,
                speed: 1,
              ),
            ),
            SafeArea(
              bottom: false,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.w),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        height: 42.r,
                        width: 42.r,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.18),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: Colors.white,
                          size: 20.sp,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: CustomText(
                          text: 'Edit Profile',
                          color: Colors.white,
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(width: 42.w),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfileImagePicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CircleAvatar(
          radius: 58.r,
          backgroundColor: AppColors.primary.withOpacity(0.10),
          child: Icon(
            Icons.person_rounded,
            color: AppColors.primary,
            size: 62.sp,
          ),
        ),
        Positioned(
          right: -4.w,
          bottom: 6.h,
          child: Container(
            height: 38.r,
            width: 38.r,
            decoration: BoxDecoration(
              gradient: AppColors.primaryGradient,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 3),
            ),
            child: Icon(
              Icons.edit_rounded,
              color: Colors.white,
              size: 18.sp,
            ),
          ),
        ),
      ],
    );
  }
}

class _ProfileInput extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String hint;
  final IconData icon;
  final double? height;
  final int maxLines;
  final bool readOnly;
  final VoidCallback? onTap;
  final TextInputType? keyboardType;

  const _ProfileInput({
    required this.label,
    required this.controller,
    required this.hint,
    required this.icon,
    this.height,
    this.maxLines = 1,
    this.readOnly = false,
    this.onTap,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: label,
            color: AppColors.textSecondary,
            fontSize: 14.5.sp,
            fontWeight: FontWeight.w600,
          ),
          SizedBox(height: 10.h),
          Container(
            height: height ?? 58.h,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(22.r),
              border: Border.all(
                color: AppColors.primary.withOpacity(0.12),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.035),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: maxLines > 1
                  ? CrossAxisAlignment.start
                  : CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: maxLines > 1 ? 18.h : 0),
                  child: Icon(
                    icon,
                    color: AppColors.primary,
                    size: 22.sp,
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: TextField(
                    controller: controller,
                    maxLines: maxLines,
                    readOnly: readOnly,
                    onTap: onTap,
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
                        color: AppColors.textSecondary.withOpacity(0.65),
                        fontSize: 14.5.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}