import 'package:ai_vaidya/core/constant/app_color.dart';
import 'package:ai_vaidya/screens/Reminders_section/add_reminder_screen.dart';
import 'package:ai_vaidya/widgets/animated_wave.dart';
import 'package:ai_vaidya/widgets/custom_animated_bubble.dart';
import 'package:ai_vaidya/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../providers/reminder_provider.dart';

class RemindersScreen extends StatefulWidget {
  const RemindersScreen({super.key});

  @override
  State<RemindersScreen> createState() => _RemindersScreenState();
}

class _RemindersScreenState extends State<RemindersScreen> {
  // final List<ReminderSection> sections = [
  //   ReminderSection(
  //     title: 'Medicine',
  //     items: [
  //       ReminderItem(
  //         title: 'Metformin',
  //         subtitle: '8:00 AM, Daily',
  //         icon: Icons.medication_rounded,
  //         enabled: false,
  //       ),
  //       ReminderItem(
  //         title: 'Morning Vitamins',
  //         subtitle: '9:00 AM, Daily',
  //         icon: Icons.medication_outlined,
  //         enabled: false,
  //       ),
  //     ],
  //   ),
  //   ReminderSection(
  //     title: 'Diet & Nutrition',
  //     items: [
  //       ReminderItem(
  //         title: 'Drink Water',
  //         subtitle: 'Every 2 hours',
  //         icon: Icons.water_drop_outlined,
  //         enabled: false,
  //       ),
  //     ],
  //   ),
  //   ReminderSection(
  //     title: 'Appointments',
  //     items: [
  //       ReminderItem(
  //         title: 'Cardiologist Check-up',
  //         subtitle: 'Nov 28 at 2:00 PM',
  //         icon: Icons.calendar_month_rounded,
  //         enabled: false,
  //       ),
  //     ],
  //   ),
  // ];

  @override
  Widget build(BuildContext context) {
    final reminderProvider = context.watch<ReminderProvider>();
    return Scaffold(
      backgroundColor: AppColors.background,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        elevation: 6,
        onPressed: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => const AddReminderScreen(),
    ),
  );
},
        child: Icon(
          Icons.add_rounded,
          color: Colors.white,
          size: 34.sp,
        ),
      ),
      body: Column(
        children: [
          const _ReminderHeader(),

          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(16.w, 24.h, 16.w, 90.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...reminderProvider.sections.map(
  (section) => _ReminderSectionWidget(
    section: section,
    onChanged: (item, value) {
      context
          .read<ReminderProvider>()
          .toggleReminder(item, value);
    },
  ),
),

                  SizedBox(height: 30.h),

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
          ),
        ],
      ),
    );
  }

  // Widget _dot(bool active) {
  //   return Container(
  //     height: 10.r,
  //     width: 10.r,
  //     decoration: BoxDecoration(
  //       color: active ? AppColors.primary : Colors.grey.shade300,
  //       shape: BoxShape.circle,
  //     ),
  //   );
  // }
}

class _ReminderHeader extends StatelessWidget {
  const _ReminderHeader();

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

                    SizedBox(width: 0.w),

                    Expanded(
                      
                      child: CustomText(
                        text: 'My Reminders',
                        color: Colors.white,
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w700,
                        textAlign: TextAlign.center,
                      ),
                    ),

                    // GestureDetector(
                    //   onTap: () {},
                    //   child: Container(
                    //     height: 42.r,
                    //     width: 42.r,
                    //     decoration: BoxDecoration(
                    //       color: Colors.white.withOpacity(0.18),
                    //       shape: BoxShape.circle,
                    //     ),
                    //     child: Icon(
                    //       Icons.add_rounded,
                    //       color: Colors.white,
                    //       size: 26.sp,
                    //     ),
                    //   ),
                    // ),
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

class _ReminderSectionWidget extends StatelessWidget {
  final ReminderSectionModel section;
  final void Function(
  ReminderModel item,
  bool value,
) onChanged;

  const _ReminderSectionWidget({
    required this.section,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 28.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: section.title,
            color: AppColors.textPrimary,
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
          ),

          SizedBox(height: 14.h),

          ...section.items.map(
            (item) => _ReminderCard(
              item: item,
              onChanged: (value) => onChanged(item, value),
            ),
          ),
        ],
      ),
    );
  }
}

class _ReminderCard extends StatelessWidget {
  final ReminderModel item;
  final ValueChanged<bool> onChanged;

  const _ReminderCard({
    required this.item,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.95, end: 1),
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeOut,
      builder: (context, scale, child) {
        return Transform.scale(
          scale: scale,
          child: Container(
            margin: EdgeInsets.only(bottom: 14.h),
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(26.r),
              border: Border.all(
                color: AppColors.primary.withOpacity(0.10),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  height: 58.r,
                  width: 58.r,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.10),
                    borderRadius: BorderRadius.circular(18.r),
                  ),
                  child: Icon(
                    item.icon,
                    color: AppColors.primary,
                    size: 28.sp,
                  ),
                ),

                SizedBox(width: 16.w),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: item.title,
                        color: AppColors.textPrimary,
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w700,
                        maxLines: 1,
                      ),
                      SizedBox(height: 4.h),
                      CustomText(
                        text: item.subtitle,
                        color: AppColors.textSecondary,
                        fontSize: 14.5.sp,
                        fontWeight: FontWeight.w500,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),

                Switch(
                  value: item.enabled,
                  activeColor: Colors.white,
                  activeTrackColor: AppColors.primary,
                  inactiveThumbColor: Colors.white,
                  inactiveTrackColor: Colors.grey.shade300,
                  onChanged: onChanged,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}