import 'package:ai_vaidya/core/constant/app_color.dart';
import 'package:ai_vaidya/model/doctor_model.dart';
import 'package:ai_vaidya/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorCard extends StatelessWidget {
  final DoctorModel doctor;
  final VoidCallback? onBookTap;
  final VoidCallback? onTap;

  const DoctorCard({
    super.key,
    required this.doctor,
    this.onBookTap,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final statusColor =
        doctor.isAvailableNow ? const Color(0xff4EDDC0) : AppColors.primary;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 16.h),
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(26.r),
          border: Border.all(color: Colors.grey.shade200),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.045),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    CircleAvatar(
                      radius: 42.r,
                      backgroundColor: AppColors.primary.withOpacity(0.08),
                      backgroundImage: NetworkImage(doctor.imageUrl),
                    ),
                    Positioned(
                      right: -2.w,
                      bottom: 2.h,
                      child: Container(
                        height: 24.r,
                        width: 24.r,
                        decoration: BoxDecoration(
                          color: const Color(0xff4EDDC0),
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 3),
                        ),
                        child: Icon(
                          Icons.verified_rounded,
                          color: Colors.white,
                          size: 14.sp,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(width: 16.w),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: doctor.name,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w800,
                        color: AppColors.textPrimary,
                        maxLines: 1,
                      ),
                      SizedBox(height: 5.h),
                      CustomText(
                        text: '${doctor.specialty} • ${doctor.experience}',
                        fontSize: 14.5.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textSecondary,
                        maxLines: 1,
                      ),
                      SizedBox(height: 7.h),
                      Row(
                        children: [
                          Icon(
                            Icons.star_rounded,
                            color: Colors.orange,
                            size: 22.sp,
                          ),
                          SizedBox(width: 4.w),
                          CustomText(
                            text: doctor.rating,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w800,
                            color: AppColors.textPrimary,
                          ),
                          SizedBox(width: 5.w),
                          Expanded(
                            child: CustomText(
                              text: '(${doctor.reviews} reviews)',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.textSecondary,
                              maxLines: 1,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 18.h),

            Row(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 8.h,
                      ),
                      decoration: BoxDecoration(
                        color: statusColor.withOpacity(0.13),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            doctor.isAvailableNow
                                ? Icons.calendar_month_rounded
                                : Icons.access_time_rounded,
                            color: statusColor,
                            size: 18.sp,
                          ),
                          SizedBox(width: 7.w),
                          Flexible(
                            child: CustomText(
                              text: doctor.availability,
                              fontSize: 13.5.sp,
                              fontWeight: FontWeight.w800,
                              color: statusColor,
                              maxLines: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                SizedBox(width: 12.w),

                GestureDetector(
                  onTap: onBookTap,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 22.w,
                      vertical: 11.h,
                    ),
                    decoration: BoxDecoration(
                      gradient: AppColors.primaryGradient,
                      borderRadius: BorderRadius.circular(18.r),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary.withOpacity(0.25),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: CustomText(
                      text: 'Book Now',
                      fontSize: 14.5.sp,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}