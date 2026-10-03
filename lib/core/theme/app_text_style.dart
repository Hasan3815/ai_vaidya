import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyle {
  // ================= HEADINGS =================

  static TextStyle heading1 = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 30.sp,
    fontWeight: FontWeight.w700,
    color: const Color(0xff111827),
    height: 1.2,
  );

  static TextStyle heading2 = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
    color: const Color(0xff111827),
    height: 1.25,
  );

  static TextStyle heading3 = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    color: const Color(0xff111827),
    height: 1.3,
  );

  // ================= SUB HEADINGS =================

  static TextStyle subHeading = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: const Color(0xff374151),
    height: 1.4,
  );

  // ================= BODY =================

  static TextStyle body = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 14.5.sp,
    fontWeight: FontWeight.w400,
    color: const Color(0xff6B7280),
    height: 1.5,
  );

  static TextStyle bodyMedium = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 15.sp,
    fontWeight: FontWeight.w500,
    color: const Color(0xff4B5563),
    height: 1.5,
  );

  // ================= BUTTON =================

  static TextStyle button = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: Colors.white,
    height: 1,
  );

  // ================= SMALL =================

  static TextStyle caption = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: const Color(0xff9CA3AF),
    height: 1.4,
  );
}