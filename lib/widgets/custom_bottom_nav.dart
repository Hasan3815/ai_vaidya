import 'package:ai_vaidya/core/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int>? onTap;

  const CustomBottomNav({
    super.key,
    this.currentIndex = 0,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 16,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 76.h,
          child: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: onTap,
            backgroundColor: Colors.white,
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppColors.primary,
            unselectedItemColor: AppColors.textSecondary,
            selectedFontSize: 12.sp,
            unselectedFontSize: 11.sp,
            selectedLabelStyle: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 12.sp,
              fontFamily: 'Poppins',
            ),
            unselectedLabelStyle: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 11.sp,
              fontFamily: 'Poppins',
            ),
            items: [
              _navItem(
                icon: Icons.home_rounded,
                label: 'Home',
              ),
              _navItem(
                icon: Icons.chat_rounded,
                label: 'Consult',
              ),
              _navItem(
                icon: Icons.settings,
                label: 'Settings',
              ),
              _navItem(
                icon: Icons.person_rounded,
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem _navItem({
    required IconData icon,
    required String label,
  }) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: EdgeInsets.only(top: 4.h),
        child: Icon(icon, size: 24.sp),
      ),
      activeIcon: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 14.w,
          vertical: 7.h,
        ),
        decoration: BoxDecoration(
          color: AppColors.primary.withOpacity(0.12),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Icon(
          icon,
          size: 24.sp,
          color: AppColors.primary,
        ),
      ),
      label: label,
    );
  }
}