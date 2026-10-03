import 'package:ai_vaidya/core/constant/app_color.dart';
import 'package:ai_vaidya/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorFilterChip extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const DoctorFilterChip({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: EdgeInsets.symmetric(
          horizontal: 22.w,
          vertical: 12.h,
        ),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : Colors.white,
          borderRadius: BorderRadius.circular(26.r),
          border: Border.all(
            color: isSelected ? AppColors.primary : Colors.grey.shade300,
          ),
          boxShadow: [
            if (isSelected)
              BoxShadow(
                color: AppColors.primary.withOpacity(0.25),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
          ],
        ),
        child: CustomText(
          text: title,
          fontSize: 14.5.sp,
          fontWeight: FontWeight.w700,
          color: isSelected ? Colors.white : AppColors.textPrimary,
        ),
      ),
    );
  }
}