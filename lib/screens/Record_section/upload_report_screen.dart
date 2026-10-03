import 'package:ai_vaidya/core/constant/app_color.dart';
import 'package:ai_vaidya/screens/Record_section/report_details_screen.dart';
import 'package:ai_vaidya/widgets/animated_wave.dart';
import 'package:ai_vaidya/widgets/custom_animated_bubble.dart';
import 'package:ai_vaidya/widgets/custom_button.dart';
import 'package:ai_vaidya/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UploadReportScreen extends StatefulWidget {
  const UploadReportScreen({super.key});

  @override
  State<UploadReportScreen> createState() => _UploadReportScreenState();
}

class _UploadReportScreenState extends State<UploadReportScreen> {
  final TextEditingController titleController = TextEditingController();

  String? selectedCategory;
  DateTime? selectedDate;

  final List<String> categories = [
    'Prescription',
    'Test Report',
    'Vitals',
    'Scan',
  ];

  @override
  void dispose() {
    titleController.dispose();
    super.dispose();
  }

  Future<void> pickDate() async {
    final date = await showDatePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
      initialDate: DateTime.now(),
    );

    if (date == null) return;

    setState(() {
      selectedDate = date;
    });
  }

  String get formattedDate {
    if (selectedDate == null) return 'Select a date';

    return '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          const _UploadReportHeader(),

          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(16.w, 22.h, 16.w, 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _UploadBox(
                    onTap: () {
                      debugPrint('Select file tapped');
                    },
                  ),

                  SizedBox(height: 26.h),

                  _LabelText(text: 'Title'),

                  SizedBox(height: 10.h),

                  _CustomInputField(
                    controller: titleController,
                    hintText: 'e.g., Annual Blood Test Results',
                  ),

                  SizedBox(height: 22.h),

                  _LabelText(text: 'Date of Report'),

                  SizedBox(height: 10.h),

                  GestureDetector(
                    onTap: pickDate,
                    child: _SelectionField(
                      text: formattedDate,
                      icon: Icons.calendar_month_rounded,
                      isPlaceholder: selectedDate == null,
                    ),
                  ),

                  SizedBox(height: 22.h),

                  _LabelText(text: 'Category'),

                  SizedBox(height: 10.h),

                  _CategoryDropdown(
                    value: selectedCategory,
                    categories: categories,
                    onChanged: (value) {
                      setState(() {
                        selectedCategory = value;
                      });
                    },
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
            child: CustomButton(
              text: 'Save Report',
              onTap: () {
                Navigator.push(
  context,
  MaterialPageRoute(
    builder: (_) => const ReportDetailsScreen(),
  ),
);
                
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

class _UploadReportHeader extends StatelessWidget {
  const _UploadReportHeader();

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
                        text: 'Upload Report',
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
                        Icons.upload_file_rounded,
                        color: Colors.white,
                        size: 23.sp,
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

class _UploadBox extends StatelessWidget {
  final VoidCallback onTap;

  const _UploadBox({
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _DashedBorderPainter(
        color: AppColors.primary.withOpacity(0.45),
        radius: 26.r,
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          height: 280.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(26.r),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.file_upload_outlined,
                size: 52.sp,
                color: AppColors.primary,
              ),

              SizedBox(height: 18.h),

              CustomText(
                text: 'Tap to upload file',
                color: AppColors.textPrimary,
                fontSize: 19.sp,
                fontWeight: FontWeight.w700,
              ),

              SizedBox(height: 10.h),

              CustomText(
                text: 'PDF or Image',
                color: AppColors.textSecondary,
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
              ),

              SizedBox(height: 24.h),

              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 24.w,
                  vertical: 13.h,
                ),
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(24.r),
                ),
                child: CustomText(
                  text: 'Select file',
                  color: AppColors.primary,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LabelText extends StatelessWidget {
  final String text;

  const _LabelText({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return CustomText(
      text: text,
      color: AppColors.textPrimary,
      fontSize: 17.sp,
      fontWeight: FontWeight.w700,
    );
  }
}

class _CustomInputField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  const _CustomInputField({
    required this.controller,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58.h,
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22.r),
        border: Border.all(color: AppColors.primary.withOpacity(0.14)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.035),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 15.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.textPrimary,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 14.5.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.textSecondary.withOpacity(0.70),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class _SelectionField extends StatelessWidget {
  final String text;
  final IconData icon;
  final bool isPlaceholder;

  const _SelectionField({
    required this.text,
    required this.icon,
    required this.isPlaceholder,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58.h,
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22.r),
        border: Border.all(color: AppColors.primary.withOpacity(0.14)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.035),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: CustomText(
              text: text,
              color: isPlaceholder
                  ? AppColors.textSecondary.withOpacity(0.70)
                  : AppColors.textPrimary,
              fontSize: 15.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          Icon(
            icon,
            color: AppColors.primary,
            size: 24.sp,
          ),
        ],
      ),
    );
  }
}

class _CategoryDropdown extends StatelessWidget {
  final String? value;
  final List<String> categories;
  final ValueChanged<String?> onChanged;

  const _CategoryDropdown({
    required this.value,
    required this.categories,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58.h,
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22.r),
        border: Border.all(color: AppColors.primary.withOpacity(0.14)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.035),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          isExpanded: true,
          icon: Icon(
            Icons.keyboard_arrow_down_rounded,
            color: AppColors.primary,
            size: 28.sp,
          ),
          hint: CustomText(
            text: 'Choose a category',
            color: AppColors.textSecondary.withOpacity(0.70),
            fontSize: 15.sp,
            fontWeight: FontWeight.w500,
          ),
          dropdownColor: Colors.white,
          borderRadius: BorderRadius.circular(18.r),
          items: categories.map((item) {
            return DropdownMenuItem<String>(
              value: item,
              child: CustomText(
                text: item,
                color: AppColors.textPrimary,
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
              ),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}

class _DashedBorderPainter extends CustomPainter {
  final Color color;
  final double radius;

  _DashedBorderPainter({
    required this.color,
    required this.radius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    const dashWidth = 8.0;
    const dashSpace = 6.0;

    final rRect = RRect.fromRectAndRadius(
      Offset.zero & size,
      Radius.circular(radius),
    );

    final path = Path()..addRRect(rRect);
    final metrics = path.computeMetrics();

    for (final metric in metrics) {
      double distance = 0;

      while (distance < metric.length) {
        final next = distance + dashWidth;
        canvas.drawPath(
          metric.extractPath(distance, next),
          paint,
        );
        distance = next + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}