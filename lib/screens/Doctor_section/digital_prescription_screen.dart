// import 'package:ai_vaidya/core/constant/app_color.dart';
// import 'package:ai_vaidya/widgets/custom_text.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class DigitalPrescriptionScreen extends StatelessWidget {
//   const DigitalPrescriptionScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xff111827),
//       body: Column(
//         children: [
//           Container(
//             height: 120.h,
//             padding: EdgeInsets.only(
//               top: 42.h,
//               left: 20.w,
//               right: 20.w,
//             ),
//             decoration: BoxDecoration(
//               gradient: AppColors.primaryGradient,
//             ),
//             child: Row(
//               children: [
//                 GestureDetector(
//                   onTap: () => Navigator.pop(context),
//                   child: Icon(
//                     Icons.arrow_back_rounded,
//                     color: Colors.white,
//                     size: 30.sp,
//                   ),
//                 ),

//                 Expanded(
//                   child: Center(
//                     child: CustomText(
//                       text: 'Digital Prescription',
//                       color: Colors.white,
//                       fontSize: 21.sp,
//                       fontWeight: FontWeight.w800,
//                     ),
//                   ),
//                 ),

//                 Icon(
//                   Icons.share_rounded,
//                   color: Colors.white,
//                   size: 28.sp,
//                 ),
//               ],
//             ),
//           ),

//           Expanded(
//             child: SingleChildScrollView(
//               padding: EdgeInsets.fromLTRB(16.w, 24.h, 16.w, 120.h),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   _InfoCard(),

//                   SizedBox(height: 28.h),

//                   CustomText(
//                     text: 'Medication',
//                     color: Colors.white,
//                     fontSize: 20.sp,
//                     fontWeight: FontWeight.w800,
//                   ),

//                   SizedBox(height: 16.h),

//                   const _MedicineCard(
//                     name: 'Amoxicillin',
//                     dose: '500mg',
//                     instruction:
//                         '1 tablet, twice daily after meals for 7 days',
//                   ),

//                   SizedBox(height: 16.h),

//                   const _MedicineCard(
//                     name: 'Ibuprofen',
//                     dose: '200mg',
//                     instruction:
//                         '1 tablet, as needed for pain, max 3 times a day',
//                   ),

//                   SizedBox(height: 28.h),

//                   CustomText(
//                     text: "Doctor's Signature & Seal",
//                     color: Colors.white,
//                     fontSize: 19.sp,
//                     fontWeight: FontWeight.w800,
//                   ),

//                   SizedBox(height: 16.h),

//                   Container(
//                     height: 140.h,
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                       color: const Color(0xff1B2533),
//                       borderRadius: BorderRadius.circular(28.r),
//                     ),
//                     child: Center(
//                       child: CustomText(
//                         text: 'Digitally signed by\nDr. Emily Carter',
//                         color: const Color(0xff9CA3AF),
//                         fontSize: 14.sp,
//                         fontWeight: FontWeight.w500,
//                         textAlign: TextAlign.center,
//                         maxLines: 2,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),

//       floatingActionButton: Padding(
//         padding: EdgeInsets.only(bottom: 18.h),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.end,
//           children: [
//             _ActionButton(
//               icon: Icons.notification_add_outlined,
//               text: 'Add Reminder',
//               iconColor: const Color(0xff4EDDC0),
//               onTap: () {},
//             ),

//             SizedBox(height: 12.h),

//             _ActionButton(
//               icon: Icons.save_outlined,
//               text: 'Save to Records',
//               iconColor: AppColors.primary,
//               onTap: () {},
//             ),

//             SizedBox(height: 20.h),

//             Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 FloatingActionButton(
//                   heroTag: 'more',
//                   backgroundColor: const Color(0xff3B4656),
//                   onPressed: () {},
//                   child: Icon(
//                     Icons.more_vert_rounded,
//                     color: Colors.white,
//                     size: 30.sp,
//                   ),
//                 ),

//                 SizedBox(width: 16.w),

//                 FloatingActionButton(
//                   heroTag: 'download',
//                   backgroundColor: AppColors.primary,
//                   onPressed: () {},
//                   child: Icon(
//                     Icons.download_rounded,
//                     color: Colors.white,
//                     size: 30.sp,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _InfoCard extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       padding: EdgeInsets.all(18.w),
//       decoration: BoxDecoration(
//         color: const Color(0xff1B2533),
//         borderRadius: BorderRadius.circular(28.r),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           CustomText(
//             text: 'Jane Doe, 34',
//             color: Colors.white,
//             fontSize: 21.sp,
//             fontWeight: FontWeight.w800,
//           ),
//           SizedBox(height: 20.h),
//           CustomText(
//             text: 'Dr. Emily Carter, Healthway Clinic',
//             color: const Color(0xffA7B0C0),
//             fontSize: 16.sp,
//             fontWeight: FontWeight.w500,
//           ),
//           SizedBox(height: 10.h),
//           CustomText(
//             text: '24 October 2023',
//             color: const Color(0xffA7B0C0),
//             fontSize: 16.sp,
//             fontWeight: FontWeight.w500,
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _MedicineCard extends StatelessWidget {
//   final String name;
//   final String dose;
//   final String instruction;

//   const _MedicineCard({
//     required this.name,
//     required this.dose,
//     required this.instruction,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       padding: EdgeInsets.all(18.w),
//       decoration: BoxDecoration(
//         color: const Color(0xff1B2533),
//         borderRadius: BorderRadius.circular(28.r),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           CustomText(
//             text: name,
//             color: Colors.white,
//             fontSize: 19.sp,
//             fontWeight: FontWeight.w800,
//           ),
//           SizedBox(height: 16.h),
//           CustomText(
//             text: dose,
//             color: const Color(0xffA7B0C0),
//             fontSize: 16.sp,
//             fontWeight: FontWeight.w500,
//           ),
//           SizedBox(height: 12.h),
//           CustomText(
//             text: instruction,
//             color: const Color(0xffA7B0C0),
//             fontSize: 15.5.sp,
//             fontWeight: FontWeight.w500,
//             maxLines: 3,
//             height: 1.4,
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _ActionButton extends StatelessWidget {
//   final IconData icon;
//   final String text;
//   final Color iconColor;
//   final VoidCallback onTap;

//   const _ActionButton({
//     required this.icon,
//     required this.text,
//     required this.iconColor,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         padding: EdgeInsets.symmetric(
//           horizontal: 18.w,
//           vertical: 14.h,
//         ),
//         decoration: BoxDecoration(
//           color: const Color(0xff3B4656),
//           borderRadius: BorderRadius.circular(28.r),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.18),
//               blurRadius: 14,
//               offset: const Offset(0, 6),
//             ),
//           ],
//         ),
//         child: Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Icon(
//               icon,
//               color: iconColor,
//               size: 24.sp,
//             ),
//             SizedBox(width: 10.w),
//             CustomText(
//               text: text,
//               color: Colors.white,
//               fontSize: 15.sp,
//               fontWeight: FontWeight.w800,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:ai_vaidya/core/constant/app_color.dart';
import 'package:ai_vaidya/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DigitalPrescriptionScreen extends StatelessWidget {
  const DigitalPrescriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      body: Column(
        children: [
          Container(
            height: 120.h,
            padding: EdgeInsets.only(
              top: 42.h,
              left: 20.w,
              right: 20.w,
            ),
            decoration: BoxDecoration(
              gradient: AppColors.primaryGradient,
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(28.r),
              ),
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.white,
                    size: 30.sp,
                  ),
                ),

                Expanded(
                  child: Center(
                    child: CustomText(
                      text: 'Digital Prescription',
                      color: Colors.white,
                      fontSize: 21.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),

                Icon(
                  Icons.share_rounded,
                  color: Colors.white,
                  size: 28.sp,
                ),
              ],
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(16.w, 22.h, 16.w, 130.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _InfoCard(),

                  SizedBox(height: 26.h),

                  CustomText(
                    text: 'Medication',
                    color: AppColors.textPrimary,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                  ),

                  SizedBox(height: 16.h),

                  const _MedicineCard(
                    name: 'Amoxicillin',
                    dose: '500mg',
                    instruction:
                        '1 tablet, twice daily after meals for 7 days',
                  ),

                  SizedBox(height: 16.h),

                  const _MedicineCard(
                    name: 'Ibuprofen',
                    dose: '200mg',
                    instruction:
                        '1 tablet, as needed for pain, max 3 times a day',
                  ),

                  SizedBox(height: 26.h),

                  CustomText(
                    text: "Doctor's Signature & Seal",
                    color: AppColors.textPrimary,
                    fontSize: 19.sp,
                    fontWeight: FontWeight.w700,
                  ),

                  SizedBox(height: 16.h),

                  Container(
                    height: 140.h,
                    width: double.infinity,
                    padding: EdgeInsets.all(18.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(26.r),
                      border: Border.all(
                        color: AppColors.primary.withOpacity(0.12),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.04),
                          blurRadius: 12,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Center(
                      child: CustomText(
                        text: 'Digitally signed by\nDr. Emily Carter',
                        color: AppColors.textSecondary,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 18.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            _ActionButton(
              icon: Icons.notification_add_outlined,
              text: 'Add Reminder',
              backgroundColor: Colors.white,
              textColor: AppColors.textPrimary,
              iconColor: const Color(0xff4EDDC0),
              onTap: () {},
            ),

            SizedBox(height: 12.h),

            _ActionButton(
              icon: Icons.save_outlined,
              text: 'Save to Records',
              backgroundColor: Colors.white,
              textColor: AppColors.textPrimary,
              iconColor: AppColors.primary,
              onTap: () {},
            ),

            SizedBox(height: 20.h),

            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                FloatingActionButton(
                  heroTag: 'more',
                  backgroundColor: Colors.white,
                  elevation: 4,
                  onPressed: () {},
                  child: Icon(
                    Icons.more_vert_rounded,
                    color: AppColors.textPrimary,
                    size: 30.sp,
                  ),
                ),

                SizedBox(width: 16.w),

                FloatingActionButton(
                  heroTag: 'download',
                  backgroundColor: AppColors.primary,
                  elevation: 4,
                  onPressed: () {},
                  child: Icon(
                    Icons.download_rounded,
                    color: Colors.white,
                    size: 30.sp,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(18.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(26.r),
        border: Border.all(
          color: AppColors.primary.withOpacity(0.12),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: 'Jane Doe, 34',
            color: AppColors.textPrimary,
            fontSize: 21.sp,
            fontWeight: FontWeight.w700,
          ),

          SizedBox(height: 18.h),

          CustomText(
            text: 'Dr. Emily Carter, Healthway Clinic',
            color: AppColors.textSecondary,
            fontSize: 15.5.sp,
            fontWeight: FontWeight.w500,
          ),

          SizedBox(height: 10.h),

          CustomText(
            text: '24 October 2023',
            color: AppColors.textSecondary,
            fontSize: 15.5.sp,
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
    );
  }
}

class _MedicineCard extends StatelessWidget {
  final String name;
  final String dose;
  final String instruction;

  const _MedicineCard({
    required this.name,
    required this.dose,
    required this.instruction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(18.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(26.r),
        border: Border.all(
          color: AppColors.primary.withOpacity(0.12),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 48.r,
            width: 48.r,
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.10),
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Icon(
              Icons.medication_rounded,
              color: AppColors.primary,
              size: 26.sp,
            ),
          ),

          SizedBox(width: 14.w),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: name,
                  color: AppColors.textPrimary,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                ),

                SizedBox(height: 10.h),

                CustomText(
                  text: dose,
                  color: AppColors.primary,
                  fontSize: 15.5.sp,
                  fontWeight: FontWeight.w600,
                ),

                SizedBox(height: 8.h),

                CustomText(
                  text: instruction,
                  color: AppColors.textSecondary,
                  fontSize: 14.5.sp,
                  fontWeight: FontWeight.w500,
                  maxLines: 3,
                  height: 1.4,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback onTap;

  const _ActionButton({
    required this.icon,
    required this.text,
    required this.iconColor,
    required this.backgroundColor,
    required this.textColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 18.w,
          vertical: 14.h,
        ),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(28.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 14,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: iconColor,
              size: 24.sp,
            ),

            SizedBox(width: 10.w),

            CustomText(
              text: text,
              color: textColor,
              fontSize: 15.sp,
              fontWeight: FontWeight.w700,
            ),
          ],
        ),
      ),
    );
  }
}