import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_text.dart';

class CustomAppHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onBackTap;
  final Widget? rightWidget;

  const CustomAppHeader({
    super.key,
    required this.title,
    this.onBackTap,
    this.rightWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 105.h,
      padding: EdgeInsets.only(
        top: 35.h,
        left: 18.w,
        right: 18.w,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade300,
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: onBackTap ?? () => Navigator.pop(context),
            child: Icon(
              Icons.arrow_back,
              size: 28.sp,
              color: Colors.black87,
            ),
          ),

          Expanded(
            child: Center(
              child: CustomText(
                text: title,
                fontSize: 22.sp,
                fontWeight: FontWeight.w700,
                color: Colors.black87,
              ),
            ),
          ),

          rightWidget ?? SizedBox(width: 28.w),
        ],
      ),
    );
  }
}