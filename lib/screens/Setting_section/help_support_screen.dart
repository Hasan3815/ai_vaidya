import 'package:ai_vaidya/core/constant/app_color.dart';
import 'package:ai_vaidya/screens/Setting_section/support_chat_screen.dart';
import 'package:ai_vaidya/widgets/animated_wave.dart';
import 'package:ai_vaidya/widgets/custom_animated_bubble.dart';
import 'package:ai_vaidya/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HelpSupportScreen extends StatefulWidget {
  const HelpSupportScreen({super.key});

  @override
  State<HelpSupportScreen> createState() => _HelpSupportScreenState();
}

class _HelpSupportScreenState extends State<HelpSupportScreen> {
  int openedIndex = 1;

  final faqs = const [
    {
      'question': 'How do I reset my password?',
      'answer': 'Go to login screen and tap forgot password to reset it.',
    },
    {
      'question': 'How can I book a new consultation?',
      'answer':
          'You can book a new consultation by navigating to the Consult tab and tapping on Book Now. Follow the on-screen instructions to select a specialist and a time slot that works for you.',
    },
    {
      'question': 'Where do I upload my medical reports?',
      'answer':
          'Go to Health Records and tap Add Record to upload your medical reports.',
    },
    {
      'question': 'How can I update my payment information?',
      'answer':
          'You can update payment information from Profile or during checkout.',
    },
    {
      'question': 'What is your cancellation policy?',
      'answer':
          'You can cancel before the consultation starts based on app policy.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          const _HelpHeader(),

          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(16.w, 24.h, 16.w, 28.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _SupportCard(
  icon: Icons.chat_bubble_outline_rounded,
  title: 'Live Chat',
  subtitle: 'Get immediate help',
  iconColor: const Color(0xff4EDDC0),
  bgColor: const Color(0xff4EDDC0).withOpacity(0.14),
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const SupportChatScreen(),
      ),
    );
  },
),

                  SizedBox(height: 16.h),

                  _SupportCard(
                    icon: Icons.email_outlined,
                    title: 'Email Us',
                    subtitle: "We'll respond shortly",
                    iconColor: AppColors.primary,
                    bgColor: AppColors.primary.withOpacity(0.12),
                    onTap: () {},
                  ),

                  SizedBox(height: 30.h),

                  CustomText(
                    text: 'Frequently Asked Questions',
                    color: AppColors.textPrimary,
                    fontSize: 21.sp,
                    fontWeight: FontWeight.w700,
                  ),

                  SizedBox(height: 18.h),

                  Container(
                    height: 56.h,
                    padding: EdgeInsets.symmetric(horizontal: 18.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(28.r),
                      border: Border.all(
                        color: AppColors.primary.withOpacity(0.10),
                      ),
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
                        Icon(
                          Icons.search_rounded,
                          color: AppColors.textSecondary,
                          size: 26.sp,
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: TextField(
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.textPrimary,
                            ),
                            decoration: InputDecoration(
                              hintText: 'Search for your question',
                              hintStyle: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.textSecondary,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 22.h),

                  ...List.generate(faqs.length, (index) {
                    final faq = faqs[index];
                    final isOpen = openedIndex == index;

                    return _FaqTile(
                      question: faq['question']!,
                      answer: faq['answer']!,
                      isOpen: isOpen,
                      onTap: () {
                        setState(() {
                          openedIndex = isOpen ? -1 : index;
                        });
                      },
                    );
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HelpHeader extends StatelessWidget {
  const _HelpHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 112.h,
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
                          text: 'Help & Support',
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

class _SupportCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color iconColor;
  final Color bgColor;
  final VoidCallback onTap;

  const _SupportCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.iconColor,
    required this.bgColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: 0.96, end: 1),
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeOut,
        builder: (context, scale, child) {
          return Transform.scale(
            scale: scale,
            child: Container(
              padding: EdgeInsets.all(18.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(28.r),
                border: Border.all(
                  color: AppColors.primary.withOpacity(0.08),
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
                    height: 62.r,
                    width: 62.r,
                    decoration: BoxDecoration(
                      color: bgColor,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      icon,
                      color: iconColor,
                      size: 30.sp,
                    ),
                  ),
                  SizedBox(width: 18.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: title,
                          color: AppColors.textPrimary,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700,
                        ),
                        SizedBox(height: 4.h),
                        CustomText(
                          text: subtitle,
                          color: AppColors.textSecondary,
                          fontSize: 14.5.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _FaqTile extends StatelessWidget {
  final String question;
  final String answer;
  final bool isOpen;
  final VoidCallback onTap;

  const _FaqTile({
    required this.question,
    required this.answer,
    required this.isOpen,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      margin: EdgeInsets.only(bottom: 14.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(
          color: AppColors.primary.withOpacity(isOpen ? 0.18 : 0.08),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.035),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: onTap,
            child: Padding(
              padding: EdgeInsets.all(18.w),
              child: Row(
                children: [
                  Expanded(
                    child: CustomText(
                      text: question,
                      color: AppColors.textPrimary,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      maxLines: 2,
                    ),
                  ),
                  AnimatedRotation(
                    turns: isOpen ? 0.5 : 0,
                    duration: const Duration(milliseconds: 250),
                    child: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: AppColors.textSecondary,
                      size: 28.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),

          AnimatedCrossFade(
            firstChild: const SizedBox.shrink(),
            secondChild: Container(
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(18.w, 0, 18.w, 18.h),
              child: CustomText(
                text: answer,
                color: AppColors.textSecondary,
                fontSize: 14.5.sp,
                fontWeight: FontWeight.w500,
                maxLines: 8,
                height: 1.45,
              ),
            ),
            crossFadeState:
                isOpen ? CrossFadeState.showSecond : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 250),
          ),
        ],
      ),
    );
  }
}