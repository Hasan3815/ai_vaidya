import 'package:ai_vaidya/core/constant/app_color.dart';
import 'package:ai_vaidya/screens/Ai_symptoms_section/care_advice_screen.dart';
import 'package:ai_vaidya/widgets/condition_card.dart';
import 'package:ai_vaidya/widgets/animated_wave.dart';
import 'package:ai_vaidya/widgets/custom_animated_bubble.dart';
import 'package:ai_vaidya/widgets/custom_button.dart';
import 'package:ai_vaidya/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PossibleConditionsScreen extends StatelessWidget {
  const PossibleConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final conditions = [
      ConditionModel(
        confidence: '92%',
        title: 'Migraine',
        description:
            'A recurring headache often accompanied by nausea and sensitivity to light and sound.',
        severity: 'High',
        progress: 0.92,
        bgColor: const Color(0xffECE8FF),
        accentColor: const Color(0xffEF4B36),
        textColor: const Color(0xff4B4585),
      ),
      ConditionModel(
        confidence: '85%',
        title: 'Tension Headache',
        description:
            'A diffuse, mild to moderate pain often described as feeling like a tight band around your head.',
        severity: 'Medium',
        progress: 0.75,
        bgColor: const Color(0xffFFF3E2),
        accentColor: const Color(0xffF4B400),
        textColor: const Color(0xffB7792D),
      ),
      ConditionModel(
        confidence: '78%',
        title: 'Sinusitis',
        description:
            'A condition in which the cavities around the nasal passages become inflamed.',
        severity: 'Low',
        progress: 0.35,
        bgColor: const Color(0xffE8F7ED),
        accentColor: const Color(0xff2ECC71),
        textColor: const Color(0xff2E8B57),
      ),
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          const PossibleConditionHeader(),

          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16.w),
                    margin: EdgeInsets.only(bottom: 18.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.04),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        )
                      ],
                    ),
                    child: CustomText(
                      text:
                          'This is an AI-powered prediction, not a diagnosis. Please consult a healthcare professional for medical advice.',
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textSecondary,
                      maxLines: 4,
                      height: 1.45,
                    ),
                  ),

                  ...conditions.map(
                    (condition) => ConditionCard(condition: condition),
                  ),

                  SizedBox(height: 10.h),
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
  text: 'View Care Advice',
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const CareAdviceScreen(),
      ),
    );
  },
  backgroundColor: Colors.white,
  textColor: AppColors.primary,
  borderRadius: 18.r,
  height: 52.h,
),
                SizedBox(height: 12.h),
                CustomButton(
                  text: 'Talk to a Doctor',
                  onTap: () {},
                  borderRadius: 18.r,
                  height: 52.h,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PossibleConditionHeader extends StatelessWidget {
  const PossibleConditionHeader({super.key});

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
                            text: 'Possible Conditions',
                            color: Colors.white,
                            fontSize: 21.sp,
                            fontWeight: FontWeight.w800,
                          ),
                          SizedBox(height: 4.h),
                          CustomText(
                            text: 'AI symptom analysis result',
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
                        Icons.analytics_rounded,
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