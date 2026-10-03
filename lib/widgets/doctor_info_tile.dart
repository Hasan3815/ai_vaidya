import 'package:ai_vaidya/core/constant/app_color.dart';
import 'package:ai_vaidya/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorInfoTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const DoctorInfoTile({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 22.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 42.r,
            width: 42.r,
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.10),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: AppColors.primary, size: 23.sp),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: title,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w800,
                  color: AppColors.textPrimary,
                ),
                SizedBox(height: 4.h),
                CustomText(
                  text: value,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textSecondary,
                  maxLines: 3,
                  height: 1.35,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}