import 'package:ai_vaidya/core/constant/app_color.dart';
import 'package:ai_vaidya/screens/Doctor_section/doctor_chat_screen.dart';
import 'package:ai_vaidya/screens/Doctor_section/video_call_screen.dart';
import 'package:ai_vaidya/widgets/custom_button.dart';
import 'package:ai_vaidya/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppointmentConfirmedScreen extends StatefulWidget {
  final bool isChatBooking;
  const AppointmentConfirmedScreen({super.key, this.isChatBooking = false});

  @override
  State<AppointmentConfirmedScreen> createState() =>
      _AppointmentConfirmedScreenState();
}

class _AppointmentConfirmedScreenState extends State<AppointmentConfirmedScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticOut,
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(16.w, 14.h, 16.w, 20.h),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          height: 48.r,
                          width: 48.r,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.close_rounded,
                            size: 30.sp,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 55.h),

                    ScaleTransition(
                      scale: _scaleAnimation,
                      child: Container(
                        height: 96.r,
                        width: 96.r,
                        decoration: BoxDecoration(
                          color: const Color(0xff22C55E).withOpacity(0.16),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Container(
                            height: 70.r,
                            width: 70.r,
                            decoration: BoxDecoration(
                              color: const Color(0xff22C55E).withOpacity(0.24),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.check_rounded,
                              color: const Color(0xff22C55E),
                              size: 42.sp,
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 34.h),

                    CustomText(
                      text: 'Appointment\nConfirmed!',
                      fontSize: 32.sp,
                      fontWeight: FontWeight.w900,
                      color: AppColors.textPrimary,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      height: 1.15,
                    ),

                    SizedBox(height: 22.h),

                    CustomText(
                      text:
                          'You are all set for your appointment with\nDr. Evelyn Reed. A confirmation has been\nsent to your email.',
                      fontSize: 15.5.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textSecondary,
                      textAlign: TextAlign.center,
                      maxLines: 4,
                      height: 1.45,
                    ),

                    SizedBox(height: 45.h),

                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(18.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(28.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.035),
                            blurRadius: 12,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: 'Tuesday, October 26 at 10:30\nAM PST',
                                  fontSize: 15.5.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.textSecondary,
                                  maxLines: 2,
                                  height: 1.35,
                                ),
                                SizedBox(height: 10.h),
                                CustomText(
                                  text: 'Dr. Evelyn Reed',
                                  fontSize: 16.5.sp,
                                  fontWeight: FontWeight.w900,
                                  color: AppColors.textPrimary,
                                ),
                                SizedBox(height: 6.h),
                                CustomText(
                                  text: 'General Practitioner',
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.textSecondary,
                                ),
                              ],
                            ),
                          ),
                          CircleAvatar(
                            radius: 38.r,
                            backgroundImage: const NetworkImage(
                              'https://images.unsplash.com/photo-1559839734-2b71ea197ec2?w=300',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 22.h),
              child: Column(
                children: [
                  CustomButton(
                    text: widget.isChatBooking ? 'Start Chat' : 'Join Call',
                    onTap: () {
                      if (widget.isChatBooking) {
                         Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => const DoctorChatScreen(),
    ),
  );
                        
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const VideoCallScreen(),
                          ),
                        );
                      }
                    },
                    height: 56.h,
                    borderRadius: 28.r,
                  ),

                  SizedBox(height: 14.h),

                  CustomText(
                    text: widget.isChatBooking
                        ? 'This chat will be active 15 minutes before your appointment.'
                        : 'This button will be active 15 minutes before your appointment.',
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textSecondary,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                  ),

                  SizedBox(height: 16.h),

                  CustomButton(
                    text: 'Add to Calendar',
                    onTap: () {},
                    height: 54.h,
                    borderRadius: 28.r,
                    backgroundColor: AppColors.primary.withOpacity(0.12),
                    textColor: AppColors.textPrimary,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
