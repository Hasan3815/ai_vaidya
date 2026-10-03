import 'package:ai_vaidya/core/constant/app_color.dart';
import 'package:ai_vaidya/screens/Setting_section/help_support_screen.dart';
import 'package:ai_vaidya/widgets/animated_wave.dart';
import 'package:ai_vaidya/widgets/custom_animated_bubble.dart';
import 'package:ai_vaidya/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool chronicTracking = true;
  bool aiReminders = false;
  bool dataSharing = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          const _SettingsHeader(),

          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(16.w, 24.h, 16.w, 24.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _SectionTitle(title: 'Tracking'),

                  _SettingTile(
                    icon: Icons.favorite_border_rounded,
                    title: 'Enable Chronic Disease Tracking',
                    subtitle: 'Track your chronic conditions',
                    value: chronicTracking,
                    onChanged: (value) {
                      setState(() {
                        chronicTracking = value;
                      });
                    },
                  ),

                  SizedBox(height: 24.h),

                  _SectionTitle(title: 'Notifications'),

                  _SettingTile(
                    icon: Icons.notifications_none_rounded,
                    title: 'Enable AI Reminders',
                    subtitle: 'Get smart reminders for your health',
                    value: aiReminders,
                    onChanged: (value) {
                      setState(() {
                        aiReminders = value;
                      });
                    },
                  ),

                  SizedBox(height: 24.h),

                  _SectionTitle(title: 'General'),

                  _LanguageTile(
  onTap: () {},
),

SizedBox(height: 14.h),

_SettingsNavigationTile(
  icon: Icons.help_outline_rounded,
  title: 'Help & Support',
  value: 'FAQs',
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const HelpSupportScreen(),
      ),
    );
  },
),

                  SizedBox(height: 24.h),

                  _SectionTitle(title: 'Privacy'),

                  _SettingTile(
                    icon: Icons.share_rounded,
                    title: 'Data Sharing Consent',
                    subtitle: 'Allow anonymous data sharing',
                    value: dataSharing,
                    onChanged: (value) {
                      setState(() {
                        dataSharing = value;
                      });
                    },
                  ),

                  SizedBox(height: 90.h),

                  Center(
                    child: CustomText(
                      text: 'App Version 1.0.2',
                      color: AppColors.textSecondary,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                    ),
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

class _SettingsHeader extends StatelessWidget {
  const _SettingsHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 112.h,
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
                    // GestureDetector(
                    //   onTap: () => Navigator.pop(context),
                    //   child: Container(
                    //     height: 42.r,
                    //     width: 42.r,
                    //     decoration: BoxDecoration(
                    //       color: Colors.white.withOpacity(0.18),
                    //       shape: BoxShape.circle,
                    //     ),
                    //     // child: Icon(
                    //     //   Icons.arrow_back_ios_new_rounded,
                    //     //   color: Colors.white,
                    //     //   size: 20.sp,
                    //     // ),
                    //   ),
                    // ),
                    Expanded(
                      child: Center(
                        child: CustomText(
                          text: 'Settings',
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

class _SectionTitle extends StatelessWidget {
  final String title;

  const _SectionTitle({
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: CustomText(
        text: title,
        color: AppColors.textPrimary,
        fontSize: 20.sp,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}

class _SettingTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;

  const _SettingTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.96, end: 1),
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeOut,
      builder: (context, scale, child) {
        return Transform.scale(
          scale: scale,
          child: Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(26.r),
              border: Border.all(
                color: AppColors.primary.withOpacity(0.10),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  height: 58.r,
                  width: 58.r,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.10),
                    borderRadius: BorderRadius.circular(18.r),
                  ),
                  child: Icon(
                    icon,
                    color: AppColors.primary,
                    size: 28.sp,
                  ),
                ),

                SizedBox(width: 16.w),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: title,
                        color: AppColors.textPrimary,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        maxLines: 2,
                      ),
                      SizedBox(height: 5.h),
                      CustomText(
                        text: subtitle,
                        color: AppColors.textSecondary,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        maxLines: 2,
                        height: 1.35,
                      ),
                    ],
                  ),
                ),

                Switch(
                  value: value,
                  activeColor: Colors.white,
                  activeTrackColor: AppColors.primary,
                  inactiveThumbColor: Colors.white,
                  inactiveTrackColor: Colors.grey.shade300,
                  onChanged: onChanged,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _LanguageTile extends StatelessWidget {
  final VoidCallback onTap;

  const _LanguageTile({
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(26.r),
          border: Border.all(
            color: AppColors.primary.withOpacity(0.10),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              height: 58.r,
              width: 58.r,
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.10),
                borderRadius: BorderRadius.circular(18.r),
              ),
              child: Icon(
                Icons.language_rounded,
                color: AppColors.primary,
                size: 28.sp,
              ),
            ),

            SizedBox(width: 16.w),

            Expanded(
              child: CustomText(
                text: 'Language',
                color: AppColors.textPrimary,
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
              ),
            ),

            CustomText(
              text: 'English',
              color: AppColors.textSecondary,
              fontSize: 14.5.sp,
              fontWeight: FontWeight.w500,
            ),

            SizedBox(width: 8.w),

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

class _SettingsNavigationTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final VoidCallback onTap;

  const _SettingsNavigationTile({
    required this.icon,
    required this.title,
    required this.value,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(26.r),
          border: Border.all(
            color: AppColors.primary.withOpacity(0.10),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              height: 58.r,
              width: 58.r,
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.10),
                borderRadius: BorderRadius.circular(18.r),
              ),
              child: Icon(
                icon,
                color: AppColors.primary,
                size: 28.sp,
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: CustomText(
                text: title,
                color: AppColors.textPrimary,
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            CustomText(
              text: value,
              color: AppColors.textSecondary,
              fontSize: 14.5.sp,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(width: 8.w),
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