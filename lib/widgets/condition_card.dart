import 'package:ai_vaidya/core/constant/app_color.dart';
import 'package:ai_vaidya/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConditionCard extends StatelessWidget {
  final ConditionModel condition;

  const ConditionCard({
    super.key,
    required this.condition,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(
        begin: 0,
        end: condition.progress,
      ),
      duration: const Duration(milliseconds: 900),
      curve: Curves.easeOutCubic,
      builder: (context, animatedProgress, child) {
        return Container(
          width: double.infinity,
          margin: EdgeInsets.only(bottom: 16.h),
          padding: EdgeInsets.all(18.w),
          decoration: BoxDecoration(
            color: condition.bgColor,
            borderRadius: BorderRadius.circular(28.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.045),
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CustomText(
                    text: '${condition.confidence} Confidence',
                    fontSize: 14.5.sp,
                    fontWeight: FontWeight.w700,
                    color: condition.textColor,
                  ),
                  const Spacer(),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 18.sp,
                    color: condition.textColor,
                  ),
                ],
              ),
              SizedBox(height: 18.h),
              CustomText(
                text: condition.title,
                fontSize: 19.sp,
                fontWeight: FontWeight.w800,
                color: AppColors.textPrimary,
              ),
              SizedBox(height: 16.h),
              CustomText(
                text: condition.description,
                fontSize: 15.5.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.textSecondary,
                maxLines: 4,
                height: 1.45,
              ),
              SizedBox(height: 22.h),
              Row(
                children: [
                  CustomText(
                    text: 'Severity: ${condition.severity}',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textSecondary,
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.r),
                      child: LinearProgressIndicator(
                        value: animatedProgress,
                        minHeight: 7.h,
                        backgroundColor: Colors.white,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          condition.accentColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class ConditionModel {
  final String confidence;
  final String title;
  final String description;
  final String severity;
  final double progress;
  final Color bgColor;
  final Color accentColor;
  final Color textColor;

  const ConditionModel({
    required this.confidence,
    required this.title,
    required this.description,
    required this.severity,
    required this.progress,
    required this.bgColor,
    required this.accentColor,
    required this.textColor,
  });
}