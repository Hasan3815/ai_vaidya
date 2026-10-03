import 'package:ai_vaidya/core/constant/app_color.dart';
import 'package:ai_vaidya/model/doctor_model.dart';
import 'package:ai_vaidya/screens/Doctor_section/payment_screen.dart';
import 'package:ai_vaidya/widgets/custom_button.dart';
import 'package:ai_vaidya/widgets/custom_text.dart';
import 'package:ai_vaidya/widgets/doctor_detail_header.dart';
import 'package:ai_vaidya/widgets/doctor_info_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorDetailScreen extends StatefulWidget {
  final DoctorModel doctor;

  const DoctorDetailScreen({
    super.key,
    required this.doctor,
  });

  @override
  State<DoctorDetailScreen> createState() => _DoctorDetailScreenState();
}

class _DoctorDetailScreenState extends State<DoctorDetailScreen> {
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    final doctor = widget.doctor;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  DoctorDetailHeader(doctor: doctor),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18.w),
                    child: Container(
                      height: 54.h,
                      padding: EdgeInsets.all(5.w),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withOpacity(0.08),
                        borderRadius: BorderRadius.circular(28.r),
                      ),
                      child: Row(
                        children: [
                          _tabButton('About', 0),
                          _tabButton('Reviews', 1),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 26.h),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18.w),
                    child: selectedTab == 0
                        ? _aboutSection(doctor)
                        : _reviewsSection(doctor),
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
  child: Row(
    children: [
      Expanded(
        child: CustomButton(
          text: 'Book Chat',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const PaymentScreen(
                  consultationTitle: '15-min Chat Consultation',
                  amount: '₹299',
                  discount: '- ₹50',
                  totalAmount: '₹249',
                  isChatBooking: true,
                ),
              ),
            );
          },
          height: 56.h,
          borderRadius: 22.r,
          backgroundColor: AppColors.primary.withOpacity(0.14),
          textColor: AppColors.primary,
        ),
      ),

      SizedBox(width: 14.w),

      Expanded(
        child: CustomButton(
          text: 'Book Video Call',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const PaymentScreen(
                  consultationTitle: '15-min Video Consultation',
                  amount: '₹599',
                  discount: '- ₹100',
                  totalAmount: '₹499', 
                  isChatBooking: false,
                ),
              ),
            );
          },
          height: 56.h,
          borderRadius: 22.r,
        ),
      ),
    ],
  ),
)

//           Container(
//             padding: EdgeInsets.fromLTRB(16.w, 14.h, 16.w, 22.h),
//             decoration: BoxDecoration(
//               color: AppColors.background,
//               border: Border(
//                 top: BorderSide(color: Colors.grey.shade300),
//               ),
//             ),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: CustomButton(
//                     text: 'Book Chat',
//                     onTap: () {},
//                     height: 56.h,
//                     borderRadius: 22.r,
//                     backgroundColor: AppColors.primary.withOpacity(0.14),
//                     textColor: AppColors.primary,
//                   ),
//                 ),
//                 SizedBox(width: 14.w),
//                 Expanded(
//                   child:
//                    CustomButton(
//   text: 'Book Video Call',
//   onTap: () {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (_) => const PaymentScreen(),
//       ),
//     );
//   },
//   height: 56.h,
//   borderRadius: 22.r,
// ),
//                 ),
//               ],
//             ),
//           ),
        ],
      ),
    );
  }

  Widget _tabButton(String title, int index) {
    final isSelected = selectedTab == index;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedTab = index;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(24.r),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : [],
          ),
          child: Center(
            child: CustomText(
              text: title,
              fontSize: 14.5.sp,
              fontWeight: FontWeight.w700,
              color: isSelected ? AppColors.primary : AppColors.textSecondary,
            ),
          ),
        ),
      ),
    );
  }

  Widget _aboutSection(DoctorModel doctor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: 'About',
          fontSize: 21.sp,
          fontWeight: FontWeight.w800,
          color: AppColors.textPrimary,
        ),

        SizedBox(height: 18.h),

        CustomText(
          text: doctor.about,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.textSecondary,
          maxLines: 8,
          height: 1.45,
        ),

        SizedBox(height: 28.h),

        DoctorInfoTile(
          icon: Icons.school_outlined,
          title: 'Qualifications',
          value: doctor.qualification,
        ),

        DoctorInfoTile(
          icon: Icons.local_hospital_outlined,
          title: 'Hospital Affiliation',
          value: doctor.hospital,
        ),

        DoctorInfoTile(
          icon: Icons.translate_rounded,
          title: 'Languages Spoken',
          value: doctor.languages,
        ),

        DoctorInfoTile(
          icon: Icons.payments_outlined,
          title: 'Consultation Fee',
          value: doctor.fee,
        ),

        SizedBox(height: 30.h),
      ],
    );
  }

  Widget _reviewsSection(DoctorModel doctor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: 'Patient Reviews',
          fontSize: 21.sp,
          fontWeight: FontWeight.w800,
          color: AppColors.textPrimary,
        ),
        SizedBox(height: 18.h),
        _reviewCard(
          name: 'Amit Sharma',
          review: 'Very professional and helpful doctor. Explained everything clearly.',
        ),
        _reviewCard(
          name: 'Priya Singh',
          review: 'Great consultation experience. Highly recommended.',
        ),
      ],
    );
  }

  Widget _reviewCard({
    required String name,
    required String review,
  }) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 14.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: name,
            fontSize: 16.sp,
            fontWeight: FontWeight.w800,
          ),
          SizedBox(height: 8.h),
          CustomText(
            text: review,
            fontSize: 14.5.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.textSecondary,
            maxLines: 4,
            height: 1.35,
          ),
        ],
      ),
    );
  }
}