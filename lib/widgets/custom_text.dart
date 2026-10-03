
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final int? maxLines;
  final TextAlign? textAlign;
  final double? height;
  final TextOverflow? overflow;

  const CustomText({
    super.key,
    required this.text,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.maxLines,
    this.textAlign,
    this.height,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      textAlign: textAlign,
      overflow: overflow ?? TextOverflow.ellipsis,
      style: TextStyle(
        fontFamily: 'Poppins',

        // DEFAULT PROFESSIONAL TEXT STYLE
        fontSize: fontSize ?? 15.sp,
        fontWeight: fontWeight ?? FontWeight.w500,
        color: color ?? const Color(0xff374151),

        height: height ?? 1.4,
      ),
    );
  }
}
