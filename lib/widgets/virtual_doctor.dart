import 'package:ai_vaidya/core/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_text.dart';

class VirtualDoctor extends StatefulWidget {
  final VoidCallback? onTap;

  const VirtualDoctor({
    super.key,
    this.onTap,
  });

  @override
  State<VirtualDoctor> createState() => _VirtualDoctorState();
}

class _VirtualDoctorState extends State<VirtualDoctor>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scale;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _scale = Tween<double>(begin: 0.92, end: 1.08).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 22.h),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(24.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          children: [
            ScaleTransition(
              scale: _scale,
              child: CircleAvatar(
                radius: 42.r,
                backgroundColor: AppColors.primary.withOpacity(0.12),
                child: Icon(
                  Icons.health_and_safety_rounded,
                  size: 42.sp,
                  color: AppColors.primary,
                ),
              ),
            ),
            SizedBox(height: 12.h),
            CustomText(
              text: 'Tap to talk to your virtual doctor',
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ],
        ),
      ),
    );
  }
}