import 'package:ai_vaidya/core/constant/app_color.dart';
import 'package:ai_vaidya/model/advice_model.dart';
import 'package:ai_vaidya/widgets/advice_card.dart';
import 'package:ai_vaidya/widgets/care_advice_header.dart';
import 'package:ai_vaidya/widgets/custom_button.dart';
import 'package:ai_vaidya/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CareAdviceScreen extends StatefulWidget {
  const CareAdviceScreen({super.key});

  @override
  State<CareAdviceScreen> createState() => _CareAdviceScreenState();
}

class _CareAdviceScreenState extends State<CareAdviceScreen> {
  int selectedIndex = 0;

  final List<String> tabs = [
    'Remedies',
    'Rest Tips',
    'Diet',
  ];

  final List<AdviceModel> remedies = const [
    AdviceModel(
      title: 'Warm Salt Water Gargle',
      description: 'Dissolve half a teaspoon of salt in warm water and gargle to soothe throat irritation.',
      icon: Icons.local_florist_rounded,
    ),
    AdviceModel(
      title: 'Apply a Cold Compress',
      description: 'Use a cold pack on the affected area to reduce inflammation and discomfort.',
      icon: Icons.ac_unit_rounded,
    ),
    AdviceModel(
      title: 'Increase Fluid Intake',
      description: 'Drink plenty of water, broth, or herbal tea to stay hydrated.',
      icon: Icons.water_drop_outlined,
    ),
    AdviceModel(
      title: 'Prioritize Rest',
      description: 'Allow your body to recover by getting adequate sleep and avoiding stress.',
      icon: Icons.bed_rounded,
    ),
  ];

  final List<AdviceModel> restTips = const [
    AdviceModel(
      title: 'Sleep 7-8 Hours',
      description: 'Take proper sleep and avoid using screens before bedtime.',
      icon: Icons.nightlight_round,
    ),
    AdviceModel(
      title: 'Avoid Heavy Activity',
      description: 'Do not do intense workout until your symptoms improve.',
      icon: Icons.self_improvement_rounded,
    ),
    AdviceModel(
      title: 'Stay in Fresh Air',
      description: 'Keep your room ventilated and avoid dusty environments.',
      icon: Icons.air_rounded,
    ),
  ];

  final List<AdviceModel> diet = const [
    AdviceModel(
      title: 'Eat Light Food',
      description: 'Prefer soups, fruits, soft foods, and easy-to-digest meals.',
      icon: Icons.restaurant_rounded,
    ),
    AdviceModel(
      title: 'Avoid Cold Drinks',
      description: 'Avoid refrigerated beverages if you have cough or sore throat.',
      icon: Icons.no_drinks_rounded,
    ),
    AdviceModel(
      title: 'Take Vitamin C',
      description: 'Include citrus fruits or vitamin C-rich foods in your diet.',
      icon: Icons.eco_rounded,
    ),
  ];

  List<AdviceModel> get currentList {
    if (selectedIndex == 0) return remedies;
    if (selectedIndex == 1) return restTips;
    return diet;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      body: Column(
        children: [
          const CareAdviceHeader(),

          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(16.w, 18.h, 16.w, 20.h),
              child: Column(
                children: [
                  CustomText(
                    text:
                        'Please note: This is AI-generated advice and not a substitute for professional medical consultation.',
                    fontSize: 14.5.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textSecondary,
                    textAlign: TextAlign.center,
                    maxLines: 3,
                    height: 1.45,
                  ),

                  SizedBox(height: 22.h),

                  Container(
                    height: 52.h,
                    padding: EdgeInsets.all(5.w),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.08),
                      borderRadius: BorderRadius.circular(28.r),
                    ),
                    child: Row(
                      children: List.generate(tabs.length, (index) {
                        final isSelected = selectedIndex == index;

                        return Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 250),
                              curve: Curves.easeOut,
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
                                  text: tabs[index],
                                  fontSize: 14.5.sp,
                                  fontWeight: FontWeight.w700,
                                  color: isSelected
                                      ? AppColors.textPrimary
                                      : AppColors.textSecondary,
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),

                  SizedBox(height: 22.h),

                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: Column(
                      key: ValueKey(selectedIndex),
                      children: currentList
                          .map(
                            (item) => AdviceCard(advice: item),
                          )
                          .toList(),
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
            child: Column(
              children: [
                CustomButton(
                  text: 'Book Doctor Consultation',
                  onTap: () {},
                  height: 52.h,
                  borderRadius: 28.r,
                ),
                SizedBox(height: 12.h),
                CustomButton(
                  text: 'Save Advice',
                  onTap: () {},
                  height: 52.h,
                  borderRadius: 28.r,
                  backgroundColor: AppColors.primary.withOpacity(0.18),
                  textColor: AppColors.primary,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}