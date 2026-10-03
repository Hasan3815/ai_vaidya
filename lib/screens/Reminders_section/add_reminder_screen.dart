import 'package:ai_vaidya/core/constant/app_color.dart';
import 'package:ai_vaidya/providers/reminder_provider.dart';
import 'package:ai_vaidya/widgets/animated_wave.dart';
import 'package:ai_vaidya/widgets/custom_animated_bubble.dart';
import 'package:ai_vaidya/widgets/custom_button.dart';
import 'package:ai_vaidya/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class AddReminderScreen extends StatefulWidget {
  const AddReminderScreen({super.key});

  @override
  State<AddReminderScreen> createState() => _AddReminderScreenState();
}

class _AddReminderScreenState extends State<AddReminderScreen> {
  final medicineController = TextEditingController();
  final dosageController = TextEditingController();
  final notesController = TextEditingController();

  TimeOfDay selectedTime = const TimeOfDay(hour: 8, minute: 30);
  String selectedDuration = '7 days';
  bool notificationsEnabled = true;

  final List<String> durations = [
    '3 days',
    '7 days',
    '14 days',
    '30 days',
  ];

  @override
  void dispose() {
    medicineController.dispose();
    dosageController.dispose();
    notesController.dispose();
    super.dispose();
  }

  Future<void> pickTime() async {
    final time = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );

    if (time == null) return;

    setState(() {
      selectedTime = time;
    });
  }

  String get formattedTime {
    final hour = selectedTime.hourOfPeriod == 0 ? 12 : selectedTime.hourOfPeriod;
    final minute = selectedTime.minute.toString().padLeft(2, '0');
    final period = selectedTime.period == DayPeriod.am ? 'AM' : 'PM';
    return '$hour:$minute $period';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      body: Column(
        children: [
          const _AddReminderHeader(),

          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(16.w, 22.h, 16.w, 24.h),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(20.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(28.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.04),
                          blurRadius: 14,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const _FieldLabel(text: 'Medicine Name'),
                        SizedBox(height: 10.h),
                        _InputField(
                          controller: medicineController,
                          hint: 'e.g., Paracetamol',
                          icon: Icons.local_hospital_outlined,
                        ),

                        SizedBox(height: 22.h),

                        const _FieldLabel(text: 'Dosage'),
                        SizedBox(height: 10.h),
                        _InputField(
                          controller: dosageController,
                          hint: 'e.g., 2 tablets',
                          icon: Icons.medication_rounded,
                        ),

                        SizedBox(height: 22.h),

                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const _FieldLabel(text: 'Time'),
                                  SizedBox(height: 10.h),
                                  GestureDetector(
                                    onTap: pickTime,
                                    child: _SelectionBox(
                                      icon: Icons.access_time_rounded,
                                      text: formattedTime,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(width: 14.w),

                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const _FieldLabel(text: 'Duration'),
                                  SizedBox(height: 10.h),
                                  _DurationDropdown(
                                    value: selectedDuration,
                                    durations: durations,
                                    onChanged: (value) {
                                      if (value == null) return;
                                      setState(() {
                                        selectedDuration = value;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 22.h),

                        const _FieldLabel(text: 'Notes (Optional)'),
                        SizedBox(height: 10.h),
                        _InputField(
                          controller: notesController,
                          hint: 'e.g., Take with food',
                          icon: Icons.notes_rounded,
                          maxLines: 4,
                          height: 130.h,
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 24.h),

                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 18.w,
                      vertical: 16.h,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(26.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.04),
                          blurRadius: 14,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        CustomText(
                          text: 'Enable Notifications',
                          color: AppColors.textPrimary,
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w600,
                        ),

                        const Spacer(),

                        Switch(
                          value: notificationsEnabled,
                          activeColor: Colors.white,
                          activeTrackColor: AppColors.primary,
                          inactiveThumbColor: Colors.white,
                          inactiveTrackColor: Colors.grey.shade300,
                          onChanged: (value) {
                            setState(() {
                              notificationsEnabled = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          Container(
            padding: EdgeInsets.fromLTRB(16.w, 14.h, 16.w, 22.h),
            decoration: BoxDecoration(
              color: AppColors.background,
              border: Border(
                top: BorderSide(color: Colors.grey.shade300),
              ),
            ),
            child: 
            CustomButton(
  text: 'Save Reminder',
  onTap: () {
    if (medicineController.text.trim().isEmpty ||
        dosageController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter medicine name and dosage'),
        ),
      );
      return;
    }

    context.read<ReminderProvider>().addMedicineReminder(
          medicineName: medicineController.text.trim(),
          dosage: dosageController.text.trim(),
          time: formattedTime,
          duration: selectedDuration,
        );

    Navigator.pop(context);
  },
  height: 56.h,
  borderRadius: 28.r,
),
          ),
        ],
      ),
    );
  }
}

class _AddReminderHeader extends StatelessWidget {
  const _AddReminderHeader();

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

                    Expanded(
                      child: Center(
                        child: CustomText(
                          text: 'Add Reminder',
                          color: Colors.white,
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),

                    SizedBox(width: 42.w),
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

class _FieldLabel extends StatelessWidget {
  final String text;

  const _FieldLabel({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return CustomText(
      text: text,
      color: AppColors.textPrimary,
      fontSize: 15.5.sp,
      fontWeight: FontWeight.w600,
    );
  }
}

class _InputField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final IconData icon;
  final int maxLines;
  final double? height;

  const _InputField({
    required this.controller,
    required this.hint,
    required this.icon,
    this.maxLines = 1,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 58.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22.r),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        crossAxisAlignment:
            maxLines > 1 ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: maxLines > 1 ? 18.h : 0),
            child: Icon(
              icon,
              color: AppColors.primary,
              size: 24.sp,
            ),
          ),

          SizedBox(width: 12.w),

          Expanded(
            child: TextField(
              controller: controller,
              maxLines: maxLines,
              style: TextStyle(
                fontFamily: 'Poppins',
                color: AppColors.textPrimary,
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
              ),
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: TextStyle(
                  fontFamily: 'Poppins',
                  color: AppColors.textSecondary.withOpacity(0.65),
                  fontSize: 14.5.sp,
                  fontWeight: FontWeight.w500,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SelectionBox extends StatelessWidget {
  final IconData icon;
  final String text;

  const _SelectionBox({
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58.h,
      padding: EdgeInsets.symmetric(horizontal: 14.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22.r),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: AppColors.primary,
            size: 24.sp,
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: CustomText(
              text: text,
              color: AppColors.textPrimary,
              fontSize: 15.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _DurationDropdown extends StatelessWidget {
  final String value;
  final List<String> durations;
  final ValueChanged<String?> onChanged;

  const _DurationDropdown({
    required this.value,
    required this.durations,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58.h,
      padding: EdgeInsets.symmetric(horizontal: 14.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22.r),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          isExpanded: true,
          dropdownColor: Colors.white,
          borderRadius: BorderRadius.circular(18.r),
          icon: Icon(
            Icons.keyboard_arrow_down_rounded,
            color: AppColors.primary,
            size: 26.sp,
          ),
          items: durations.map((item) {
            return DropdownMenuItem(
              value: item,
              child: Row(
                children: [
                  Icon(
                    Icons.calendar_month_rounded,
                    color: AppColors.primary,
                    size: 22.sp,
                  ),
                  SizedBox(width: 10.w),
                  CustomText(
                    text: item,
                    color: AppColors.textPrimary,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}