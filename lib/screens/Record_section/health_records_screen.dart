import 'package:ai_vaidya/core/constant/app_color.dart';
import 'package:ai_vaidya/providers/health_record_provider.dart';
import 'package:ai_vaidya/screens/Record_section/upload_report_screen.dart';
import 'package:ai_vaidya/widgets/animated_wave.dart';
import 'package:ai_vaidya/widgets/custom_animated_bubble.dart';
import 'package:ai_vaidya/widgets/custom_button.dart';
import 'package:ai_vaidya/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HealthRecordsScreen extends StatelessWidget {
  final VoidCallback? onBackToHome;
  const HealthRecordsScreen({super.key,this.onBackToHome,});

  @override
  Widget build(BuildContext context) {
    final healthProvider =
    context.watch<HealthRecordProvider>();
    // final records = [
    //   _RecordItem(
    //     title: 'Prescriptions',
    //     subtitle: 'View your medications',
    //     icon: Icons.medication_rounded,
    //   ),
    //   _RecordItem(
    //     title: 'Test Reports',
    //     subtitle: 'Access your lab results',
    //     icon: Icons.science_rounded,
    //   ),
    //   _RecordItem(
    //     title: 'Vitals',
    //     subtitle: 'Track key health metrics',
    //     icon: Icons.favorite_border_rounded,
    //   ),
    //   _RecordItem(
    //     title: 'Scans',
    //     subtitle: 'See your medical imaging',
    //     icon: Icons.image_search_rounded,
    //   ),
    // ];

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          const _HealthRecordsHeader(),

          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(16.w, 24.h, 16.w, 20.h),
              child: GridView.builder(
                itemCount: healthProvider.records.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 18.h,
                  crossAxisSpacing: 16.w,
                  childAspectRatio: 0.98,
                ),
                itemBuilder: (context, index) {
                 return _HealthRecordCard(
  item: healthProvider.records[index],
);
                },
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.fromLTRB(16.w, 10.h, 16.w, 30.h),
            child: Column(
              children: [
                CustomButton(
  text: 'Add Record',
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const UploadReportScreen(),
      ),
    );
  },
  height: 58.h,
  borderRadius: 30.r,
),
                SizedBox(height: 20.h),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     _dot(true),
                //     SizedBox(width: 10.w),
                //     _dot(false),
                //     SizedBox(width: 10.w),
                //     _dot(false),
                //   ],
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget _dot(bool active) {
  //   return AnimatedContainer(
  //     duration: const Duration(milliseconds: 250),
  //     height: 10.r,
  //     width: 10.r,
  //     decoration: BoxDecoration(
  //       color: active ? AppColors.primary : Colors.grey.shade400,
  //       shape: BoxShape.circle,
  //     ),
  //   );
  // }
}

class _HealthRecordsHeader extends StatelessWidget {
  const _HealthRecordsHeader();

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
                        text: 'Health Records',
                        color: Colors.white,
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w700,
                        textAlign: TextAlign.center,
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
                        Icons.folder_copy_rounded,
                        color: Colors.white,
                        size: 22.sp,
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

class _HealthRecordCard extends StatelessWidget {
 final HealthRecordModel item;

  const _HealthRecordCard({
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.94, end: 1),
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeOut,
      builder: (context, scale, child) {
        return Transform.scale(
          scale: scale,
          child: Container(
            padding: EdgeInsets.all(18.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(26.r),
              border: Border.all(
                color: AppColors.primary.withOpacity(0.10),
              ),
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
                Container(
                  height: 54.r,
                  width: 54.r,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.10),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    item.icon,
                    color: AppColors.primary,
                    size: 28.sp,
                  ),
                ),
                const Spacer(),
                CustomText(
                  text: item.title,
                  color: AppColors.textPrimary,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  maxLines: 2,
                ),
                SizedBox(height: 6.h),
                CustomText(
                  text: item.subtitle,
                  color: AppColors.textSecondary,
                  fontSize: 14.5.sp,
                  fontWeight: FontWeight.w500,
                  maxLines: 2,
                  height: 1.35,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

