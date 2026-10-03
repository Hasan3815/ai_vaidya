import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_text.dart';

class HealthCard extends StatelessWidget {
  final String title;
  final String value;
  final String change;
  final bool isUp;
  final bool fullWidth;
  final IconData? icon;
  final VoidCallback? onTap;

  const HealthCard({
    super.key,
    required this.title,
    required this.value,
    required this.change,
    required this.isUp,
    this.fullWidth = false,
    this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(22.r),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
          child: Container(
            width: fullWidth ? double.infinity : null,
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.18),
              borderRadius: BorderRadius.circular(22.r),
              border: Border.all(
                color: Colors.white.withOpacity(0.18),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: CustomText(
                        text: title,
                        color: Colors.white70,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    if (icon != null)
                      Icon(
                        icon,
                        color: Colors.white,
                        size: 20.sp,
                      ),
                  ],
                ),
                SizedBox(height: 10.h),
                CustomText(
                  text: value,
                  color: Colors.white,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    Icon(
                      isUp
                          ? Icons.arrow_upward_rounded
                          : Icons.arrow_downward_rounded,
                      color: isUp
                          ? Colors.lightGreenAccent
                          : Colors.orangeAccent,
                      size: 16.sp,
                    ),
                    SizedBox(width: 4.w),
                    CustomText(
                      text: change,
                      color: isUp
                          ? Colors.lightGreenAccent
                          : Colors.orangeAccent,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}