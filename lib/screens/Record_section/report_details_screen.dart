import 'package:ai_vaidya/core/constant/app_color.dart';
import 'package:ai_vaidya/widgets/animated_wave.dart';
import 'package:ai_vaidya/widgets/custom_animated_bubble.dart';
import 'package:ai_vaidya/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReportDetailsScreen extends StatelessWidget {
  const ReportDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          const _ReportDetailsHeader(),

          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(16.w, 22.h, 16.w, 30.h),
              child: Column(
                children: [
                  Container(
                    height: 330.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(28.r),
                      border: Border.all(
                        color: AppColors.primary.withOpacity(0.12),
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 78.r,
                          width: 78.r,
                          decoration: BoxDecoration(
                            color: AppColors.primary.withOpacity(0.10),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.picture_as_pdf_rounded,
                            color: AppColors.primary,
                            size: 40.sp,
                          ),
                        ),
                        SizedBox(height: 18.h),
                        CustomText(
                          text: 'Annual Report 2023',
                          color: AppColors.textPrimary,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700,
                        ),
                        SizedBox(height: 8.h),
                        CustomText(
                          text: 'PDF preview is ready',
                          color: AppColors.textSecondary,
                          fontSize: 14.5.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(height: 24.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _dot(true),
                            SizedBox(width: 10.w),
                            _dot(false),
                            SizedBox(width: 10.w),
                            _dot(false),
                            SizedBox(width: 10.w),
                            _dot(false),
                          ],
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 26.h),

                  _InfoSection(),

                  SizedBox(height: 34.h),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _ActionItem(
                        icon: Icons.share_rounded,
                        label: 'Share',
                        iconColor: AppColors.primary,
                        backgroundColor: AppColors.primary.withOpacity(0.10),
                        onTap: () {},
                      ),
                      _ActionItem(
                        icon: Icons.download_rounded,
                        label: 'Download',
                        iconColor: AppColors.primary,
                        backgroundColor: AppColors.primary.withOpacity(0.10),
                        onTap: () {},
                      ),
                      _ActionItem(
                        icon: Icons.delete_outline_rounded,
                        label: 'Delete',
                        iconColor: Colors.red,
                        backgroundColor: Colors.red.withOpacity(0.10),
                        onTap: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _dot(bool active) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      height: 10.r,
      width: 10.r,
      decoration: BoxDecoration(
        color: active ? AppColors.primary : Colors.grey.shade300,
        shape: BoxShape.circle,
      ),
    );
  }
}

class _ReportDetailsHeader extends StatelessWidget {
  const _ReportDetailsHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 155.h,
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
                      onTap: () => Navigator.pop(context),
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

                    SizedBox(width: 14.w),

                    Expanded(
                      child: CustomText(
                        text: 'Annual_Report_2023.pdf',
                        color: Colors.white,
                        fontSize: 19.sp,
                        fontWeight: FontWeight.w700,
                        textAlign: TextAlign.center,
                        maxLines: 1,
                      ),
                    ),

                    Container(
                      height: 42.r,
                      width: 42.r,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.18),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.more_vert_rounded,
                        color: Colors.white,
                        size: 24.sp,
                      ),
                    ),
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

class _InfoSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(26.r),
        border: Border.all(
          color: AppColors.primary.withOpacity(0.12),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.035),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: const Column(
        children: [
          _InfoRow(title: 'File Type', value: 'PDF Document'),
          _InfoRow(title: 'File Size', value: '2.5 MB'),
          _InfoRow(title: 'Upload Date', value: 'Oct 26, 2023'),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String title;
  final String value;

  const _InfoRow({
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 18.h),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade200,
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: CustomText(
              text: title,
              color: AppColors.textSecondary,
              fontSize: 15.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          CustomText(
            text: value,
            color: AppColors.textPrimary,
            fontSize: 15.sp,
            fontWeight: FontWeight.w600,
          ),
        ],
      ),
    );
  }
}

class _ActionItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color iconColor;
  final Color backgroundColor;
  final VoidCallback onTap;

  const _ActionItem({
    required this.icon,
    required this.label,
    required this.iconColor,
    required this.backgroundColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            height: 62.r,
            width: 62.r,
            decoration: BoxDecoration(
              color: backgroundColor,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: iconColor,
              size: 28.sp,
            ),
          ),
          SizedBox(height: 10.h),
          CustomText(
            text: label,
            color: label == 'Delete' ? Colors.red : AppColors.textPrimary,
            fontSize: 15.sp,
            fontWeight: FontWeight.w600,
          ),
        ],
      ),
    );
  }
}