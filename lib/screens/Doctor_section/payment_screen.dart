// 

import 'package:ai_vaidya/core/constant/app_color.dart';
import 'package:ai_vaidya/screens/Doctor_section/appointment_confirmed_screen.dart';
import 'package:ai_vaidya/widgets/animated_wave.dart';
import 'package:ai_vaidya/widgets/custom_animated_bubble.dart';
import 'package:ai_vaidya/widgets/custom_button.dart';
import 'package:ai_vaidya/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentScreen extends StatefulWidget {
  final String consultationTitle;
  final String amount;
  final String discount;
  final String totalAmount;
  final bool isChatBooking;

  const PaymentScreen({
    super.key,
    this.consultationTitle = '15-min Video Consultation',
    this.amount = '₹599',
    this.discount = '- ₹100',
    this.totalAmount = '₹499',
    this.isChatBooking = false,
  });

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int selectedPayment = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          const _PaymentHeader(),

          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(16.w, 22.h, 16.w, 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: 'Consultation Summary',
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w800,
                    color: AppColors.textPrimary,
                  ),

                  SizedBox(height: 16.h),

                  Container(
                    padding: EdgeInsets.all(18.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(26.r),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Column(
                      children: [
                        _summaryRow(widget.consultationTitle, widget.amount),
                        SizedBox(height: 22.h),
                        _summaryRow(
                          'Subscription Discount',
                          widget.discount,
                          color: Colors.green,
                        ),
                        SizedBox(height: 22.h),
                        Divider(color: Colors.grey.shade300),
                        SizedBox(height: 18.h),
                        _summaryRow(
                          'Total Amount',
                          widget.totalAmount,
                          isBold: true,
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 34.h),

                  CustomText(
                    text: 'Select Payment Method',
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w800,
                    color: AppColors.textPrimary,
                  ),

                  SizedBox(height: 16.h),

                  _paymentOption(
                    index: 0,
                    title: 'UPI',
                    isExpanded: true,
                    child: Column(
                      children: [
                        SizedBox(height: 18.h),

                        Container(
                          height: 50.h,
                          padding: EdgeInsets.only(left: 16.w),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(18.r),
                            border: Border.all(color: Colors.grey.shade300),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Enter UPI ID',
                                    hintStyle: TextStyle(
                                      fontSize: 14.5.sp,
                                      color: Colors.grey.shade500,
                                    ),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),

                              Container(
                                height: 44.h,
                                margin: EdgeInsets.only(right: 4.w),
                                padding: EdgeInsets.symmetric(horizontal: 20.w),
                                decoration: BoxDecoration(
                                  gradient: AppColors.primaryGradient,
                                  borderRadius: BorderRadius.circular(12.r),
                                ),
                                child: Center(
                                  child: CustomText(
                                    text: 'Verify',
                                    color: Colors.white,
                                    fontSize: 14.5.sp,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 22.h),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            _UpiApp(title: 'GPay', icon: Icons.g_mobiledata),
                            _UpiApp(title: 'PhonePe', icon: Icons.payments),
                            _UpiApp(
                              title: 'Paytm',
                              icon: Icons.account_balance_wallet,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 14.h),

                  _paymentOption(
                    index: 1,
                    title: 'Card',
                    isExpanded: false,
                  ),

                  SizedBox(height: 14.h),

                  _paymentOption(
                    index: 2,
                    title: 'Wallet',
                    isExpanded: false,
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
            child: Column(
              children: [
                CustomButton(
                  text: 'Pay ${widget.totalAmount}',
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => AppointmentConfirmedScreen(
      isChatBooking: widget.isChatBooking,
    ),
                      ),
                    );
                  },
                  height: 56.h,
                  borderRadius: 28.r,
                ),

                SizedBox(height: 18.h),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.lock_outline_rounded,
                      size: 18.sp,
                      color: AppColors.textSecondary,
                    ),
                    SizedBox(width: 8.w),
                    CustomText(
                      text: '100% Secure Payments powered by Razorpay',
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textSecondary,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _summaryRow(
    String title,
    String value, {
    Color? color,
    bool isBold = false,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          text: title,
          fontSize: isBold ? 16.sp : 15.sp,
          fontWeight: isBold ? FontWeight.w800 : FontWeight.w500,
          color: color ?? AppColors.textPrimary,
        ),
        CustomText(
          text: value,
          fontSize: isBold ? 17.sp : 15.sp,
          fontWeight: FontWeight.w800,
          color: color ?? AppColors.textPrimary,
        ),
      ],
    );
  }

  Widget _paymentOption({
    required int index,
    required String title,
    required bool isExpanded,
    Widget? child,
  }) {
    final isSelected = selectedPayment == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedPayment = index;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primary.withOpacity(0.10)
              : Colors.white,
          borderRadius: BorderRadius.circular(24.r),
          border: Border.all(
            color: isSelected ? AppColors.primary : Colors.grey.shade300,
            width: isSelected ? 1.4 : 1,
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  isSelected
                      ? Icons.radio_button_checked
                      : Icons.radio_button_off,
                  color: isSelected ? AppColors.primary : Colors.grey.shade400,
                  size: 22.sp,
                ),
                SizedBox(width: 14.w),
                CustomText(
                  text: title,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
                const Spacer(),
                Icon(
                  isSelected
                      ? Icons.keyboard_arrow_up_rounded
                      : Icons.keyboard_arrow_down_rounded,
                  size: 28.sp,
                  color: AppColors.textPrimary,
                ),
              ],
            ),

            if (isSelected && child != null) child,
          ],
        ),
      ),
    );
  }
}

class _PaymentHeader extends StatelessWidget {
  const _PaymentHeader();

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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: 'Complete Payment',
                            color: Colors.white,
                            fontSize: 21.sp,
                            fontWeight: FontWeight.w800,
                          ),
                          SizedBox(height: 4.h),
                          CustomText(
                            text: 'Secure doctor consultation payment',
                            color: Colors.white.withOpacity(0.82),
                            fontSize: 12.5.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                    ),

                    Container(
                      height: 44.r,
                      width: 44.r,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.18),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.payment_rounded,
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

class _UpiApp extends StatelessWidget {
  final String title;
  final IconData icon;

  const _UpiApp({
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 42.r,
          width: 42.r,
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.12),
            borderRadius: BorderRadius.circular(6.r),
          ),
          child: Icon(
            icon,
            color: AppColors.primary,
            size: 25.sp,
          ),
        ),
        SizedBox(height: 8.h),
        CustomText(
          text: title,
          fontSize: 13.5.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.textSecondary,
        ),
      ],
    );
  }
}