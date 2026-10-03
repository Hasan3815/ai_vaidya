import 'package:ai_vaidya/core/constant/app_color.dart';
import 'package:ai_vaidya/model/doctor_model.dart';
import 'package:ai_vaidya/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorDetailHeader extends StatelessWidget {
  final DoctorModel doctor;

  const DoctorDetailHeader({
    super.key,
    required this.doctor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18.w, 42.h, 18.w, 20.h),
      child: Column(
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Icon(Icons.arrow_back, size: 28.sp),
              ),
              Expanded(
                child: Center(
                  child: CustomText(
                    text: doctor.name,
                    fontSize: 21.sp,
                    fontWeight: FontWeight.w800,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
              Icon(Icons.bookmark_border_rounded, size: 28.sp),
            ],
          ),

          SizedBox(height: 38.h),

          Row(
            children: [
              CircleAvatar(
                radius: 52.r,
                backgroundImage: NetworkImage(doctor.imageUrl),
              ),
              SizedBox(width: 20.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: doctor.name,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w800,
                      color: AppColors.textPrimary,
                    ),
                    SizedBox(height: 6.h),
                    CustomText(
                      text: doctor.specialty,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textSecondary,
                    ),
                    SizedBox(height: 6.h),
                    CustomText(
                      text: '${doctor.experience} experience',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textSecondary,
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: 38.h),

          Align(
            alignment: Alignment.centerLeft,
            child: CustomText(
              text: doctor.rating,
              fontSize: 40.sp,
              fontWeight: FontWeight.w900,
              color: AppColors.textPrimary,
            ),
          ),

          SizedBox(height: 10.h),

          Row(
            children: List.generate(
              5,
              (index) => Icon(
                Icons.star_border_rounded,
                color: Colors.amber,
                size: 24.sp,
              ),
            ),
          ),

          SizedBox(height: 16.h),

          Align(
            alignment: Alignment.centerLeft,
            child: CustomText(
              text: '${doctor.reviews} reviews',
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}