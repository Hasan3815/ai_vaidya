import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/constant/app_color.dart';
import 'animated_wave.dart';
import 'custom_animated_bubble.dart';
import 'custom_text.dart';

class CustomTopAnimatedHeader extends StatelessWidget {
  final String title;
  final String? subtitle;
  final bool showBackButton;
  final VoidCallback? onBackTap;
  final Widget? trailing;
  final Widget? bottomChild;
  final double height;

  const CustomTopAnimatedHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.showBackButton = false,
    this.onBackTap,
    this.trailing,
    this.bottomChild,
    this.height = 320,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height.h,
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
              left: 20.w,
              top: 80.h,
              color: Colors.white.withOpacity(0.12),
              duration: const Duration(seconds: 4),
            ),
            CustomAnimatedBubble(
              size: 60.r,
              left: 270.w,
              top: 50.h,
              color: Colors.white.withOpacity(0.16),
              duration: const Duration(seconds: 3),
            ),
            CustomAnimatedBubble(
              size: 120.r,
              left: 300.w,
              top: 190.h,
              color: Colors.white.withOpacity(0.08),
              duration: const Duration(seconds: 5),
            ),

            Positioned(
              bottom: -12.h,
              left: 0,
              right: 0,
              child: AnimatedWave(
                color: Colors.white.withOpacity(0.14),
                height: 120.h,
                speed: 1,
              ),
            ),

            SafeArea(
              bottom: false,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 22.w),
                child: Column(
                  children: [
                    SizedBox(height: 18.h),

                    Row(
                      children: [
                        if (showBackButton) ...[
                          GestureDetector(
                            onTap: onBackTap ?? () => Navigator.pop(context),
                            child: Icon(
                              Icons.arrow_back_ios_new,
                              color: Colors.white,
                              size: 22.sp,
                            ),
                          ),
                          SizedBox(width: 14.w),
                        ],

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: title,
                                color: Colors.white,
                                fontSize: 22.sp,
                                fontWeight: FontWeight.w700,
                              ),
                              if (subtitle != null) ...[
                                SizedBox(height: 4.h),
                                CustomText(
                                  text: subtitle!,
                                  color: Colors.white70,
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ],
                            ],
                          ),
                        ),

                        trailing ??
                            Icon(
                              Icons.account_circle_outlined,
                              color: Colors.white,
                              size: 34.sp,
                            ),
                      ],
                    ),

                    if (bottomChild != null) ...[
                      SizedBox(height: 10.h),
                      bottomChild!,
                    ],
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