import 'package:ai_vaidya/core/constant/app_color.dart';
import 'package:ai_vaidya/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  final Color? backgroundColor;
  final Color? textColor;

  final double? height;
  final double? borderRadius;

  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    this.backgroundColor,
    this.textColor,
    this.height,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height ?? 52.h,

        decoration: BoxDecoration(
          gradient: backgroundColor == null
              ? AppColors.primaryGradient
              : null,

          color: backgroundColor,

          borderRadius: BorderRadius.circular(
            borderRadius ?? 18.r,
          ),
        ),

        child: Center(
          child: CustomText(
            text: text,
            color: textColor ?? Colors.white,
            fontSize: 15.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}