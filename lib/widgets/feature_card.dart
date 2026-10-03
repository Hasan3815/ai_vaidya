import 'package:ai_vaidya/core/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_text.dart';

class FeatureCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final bool fullWidth;
  final VoidCallback? onTap;

  const FeatureCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    this.fullWidth = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(22.r),
      onTap: onTap,
      child: Container(
        width: fullWidth ? double.infinity : null,
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(22.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 22.r,
              backgroundColor: AppColors.primary.withOpacity(0.10),
              child: Icon(
                icon,
                color: AppColors.primary,
                size: 22.sp,
              ),
            ),
            SizedBox(height: 14.h),
            CustomText(
              text: title,
              fontSize: 15.sp,
              
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
              maxLines: 2,
            ),
            SizedBox(height: 6.h),
            CustomText(
              text: subtitle,
              fontSize: 12.sp,
              color: AppColors.textSecondary,
              maxLines: 2,
            ),
          ],
        ),
      ),
    );
  }
}