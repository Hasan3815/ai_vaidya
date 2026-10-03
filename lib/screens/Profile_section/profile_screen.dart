import 'package:ai_vaidya/core/constant/app_color.dart';
import 'package:ai_vaidya/providers/profile_provider.dart';
import 'package:ai_vaidya/screens/Profile_section/edit_profile_screen.dart';
import 'package:ai_vaidya/widgets/animated_wave.dart';
import 'package:ai_vaidya/widgets/custom_animated_bubble.dart';
import 'package:ai_vaidya/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  final VoidCallback? onBackToHome;
 
  const ProfileScreen({super.key,
    this.onBackToHome,});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
           _ProfileHeader(onBackToHome: onBackToHome),

          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(16.w, 24.h, 16.w, 30.h),
              child: Column(
                children: [
                  _ProfileCard(),

                  SizedBox(height: 22.h),

                  _MenuCard(
                    items: [
                      ProfileMenuItem(
                        title: 'My Subscriptions',
                        icon: Icons.credit_card_rounded,
                        onTap: () {},
                      ),
                      ProfileMenuItem(
                        title: 'Payment History',
                        icon: Icons.receipt_long_rounded,
                        onTap: () {},
                      ),
                      ProfileMenuItem(
  title: 'Edit Profile',
  icon: Icons.person_outline_rounded,
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const EditProfileScreen(),
      ),
    );
  },
),
                    ],
                  ),

                  SizedBox(height: 22.h),

                  _LogoutCard(
                    onTap: () {},
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

class _ProfileHeader extends StatelessWidget {
   final VoidCallback? onBackToHome;
  const _ProfileHeader({
    this.onBackToHome,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 115.h,
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
                      onTap: onBackToHome,
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
                          text: 'Profile',
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

class _ProfileCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final profileProvider = context.watch<ProfileProvider>();

    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.95, end: 1),
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeOut,
      builder: (context, scale, child) {
        return Transform.scale(
          scale: scale,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 28.h,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(28.r),
              border: Border.all(
                color: AppColors.primary.withOpacity(0.10),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 14,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Column(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    CircleAvatar(
                      radius: 52.r,
                      backgroundColor: AppColors.primary.withOpacity(0.10),
                      child: Icon(
                        Icons.person_rounded,
                        color: AppColors.primary,
                        size: 54.sp,
                      ),
                    ),
                    Positioned(
                      right: -4.w,
                      bottom: 4.h,
                      child: Container(
                        height: 34.r,
                        width: 34.r,
                        decoration: BoxDecoration(
                          gradient: AppColors.primaryGradient,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: 3,
                          ),
                        ),
                        child: Icon(
                          Icons.edit_rounded,
                          color: Colors.white,
                          size: 17.sp,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 22.h),

                CustomText(
                  text: profileProvider.name,
                  color: AppColors.textPrimary,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                ),

                SizedBox(height: 8.h),

                CustomText(
                  text:
                      '${profileProvider.age} years | ${profileProvider.email}',
                  color: AppColors.textSecondary,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}


class _MenuCard extends StatelessWidget {
  final List<ProfileMenuItem> items;

  const _MenuCard({
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28.r),
        border: Border.all(
          color: AppColors.primary.withOpacity(0.10),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: List.generate(items.length, (index) {
          final item = items[index];

          return Column(
            children: [
              _MenuTile(item: item),
              if (index != items.length - 1)
                Divider(
                  height: 1,
                  color: Colors.grey.shade200,
                ),
            ],
          );
        }),
      ),
    );
  }
}

class _MenuTile extends StatelessWidget {
  final ProfileMenuItem item;

  const _MenuTile({
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: item.onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 18.h),
        child: Row(
          children: [
            Container(
              height: 46.r,
              width: 46.r,
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.10),
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Icon(
                item.icon,
                color: AppColors.primary,
                size: 24.sp,
              ),
            ),

            SizedBox(width: 16.w),

            Expanded(
              child: CustomText(
                text: item.title,
                color: AppColors.textPrimary,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),

            Icon(
              Icons.arrow_forward_ios_rounded,
              color: AppColors.textSecondary,
              size: 18.sp,
            ),
          ],
        ),
      ),
    );
  }
}

class _LogoutCard extends StatelessWidget {
  final VoidCallback onTap;

  const _LogoutCard({
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 18.w,
          vertical: 18.h,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(28.r),
          border: Border.all(
            color: Colors.red.withOpacity(0.10),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 14,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              height: 46.r,
              width: 46.r,
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.10),
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Icon(
                Icons.logout_rounded,
                color: Colors.red,
                size: 24.sp,
              ),
            ),

            SizedBox(width: 16.w),

            Expanded(
              child: CustomText(
                text: 'Logout',
                color: Colors.red,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),

            Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.red,
              size: 18.sp,
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileMenuItem {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  ProfileMenuItem({
    required this.title,
    required this.icon,
    required this.onTap,
  });
}