import 'package:ai_vaidya/core/constant/app_color.dart';
import 'package:ai_vaidya/model/advice_model.dart';
import 'package:ai_vaidya/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdviceCard extends StatelessWidget {
  final AdviceModel advice;

  const AdviceCard({
    super.key,
    required this.advice,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.92, end: 1),
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeOut,
      builder: (context, scale, child) {
        return Transform.scale(
          scale: scale,
          child: Container(
            margin: EdgeInsets.only(bottom: 14.h),
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(28.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.045),
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
                    advice.icon,
                    color: AppColors.primary,
                    size: 30.sp,
                  ),
                ),

                SizedBox(width: 16.w),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: advice.title,
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w800,
                        color: AppColors.textPrimary,
                        maxLines: 1,
                      ),

                      SizedBox(height: 6.h),

                      CustomText(
                        text: advice.description,
                        fontSize: 14.5.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textSecondary,
                        maxLines: 2,
                        height: 1.35,
                      ),
                    ],
                  ),
                ),

                SizedBox(width: 10.w),

                Row(
                  children: [
                    Icon(
                      Icons.thumb_up_alt_outlined,
                      color: AppColors.textSecondary,
                      size: 23.sp,
                    ),

                    SizedBox(width: 10.w),

                    Icon(
                      Icons.thumb_down_alt_outlined,
                      color: AppColors.textSecondary,
                      size: 23.sp,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}