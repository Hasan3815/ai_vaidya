import 'package:ai_vaidya/core/constant/app_color.dart';
import 'package:ai_vaidya/screens/Ai_symptoms_section/possible_conditions_screen.dart';
import 'package:ai_vaidya/widgets/animated_wave.dart';
import 'package:ai_vaidya/widgets/custom_animated_bubble.dart';
import 'package:ai_vaidya/widgets/custom_button.dart';
import 'package:ai_vaidya/widgets/symptoms_chat_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../widgets/custom_text.dart';

class SymptomCheckerScreen extends StatefulWidget {
  const SymptomCheckerScreen({super.key});

  @override
  State<SymptomCheckerScreen> createState() => _SymptomCheckerScreenState();
}

class _SymptomCheckerScreenState extends State<SymptomCheckerScreen> {
  bool showPredictionButton = false;
  final TextEditingController symptomController = TextEditingController();

  final List<String> quickSymptoms = const [
    'Fever',
    'Cough',
    'Headache',
    'Sore Throat',
  ];

  final List<Map<String, dynamic>> messages = [
    {
      'message':
          'Hello! How are you feeling today?\nPlease describe your symptoms.',
      'isUser': false,
      'label': 'AI Assistant',
    },
  ];

  bool isTyping = false;

  @override
  void dispose() {
    symptomController.dispose();
    super.dispose();
  }

  // void sendMessage() {
  //   final text = symptomController.text.trim();

  //   if (text.isEmpty) return;

  //   setState(() {
  //     messages.add({
  //       'message': text,
  //       'isUser': true,
  //       'label': null,
  //     });
  //     isTyping = true;
  //   });

  //   symptomController.clear();

  //   Future.delayed(const Duration(seconds: 2), () {
  //     if (!mounted) return;

  //     setState(() {
  //       isTyping = false;
  //       messages.add({
  //         'message':
  //             'Thanks for sharing. Please monitor your symptoms. If fever continues, breathing becomes difficult, or symptoms worsen, consult a doctor.',
  //         'isUser': false,
  //         'label': 'AI Assistant',
  //       });
  //     });
  //   });
  // }

  void sendMessage() {
  final text = symptomController.text.trim();

  if (text.isEmpty) return;

  setState(() {
    messages.add({
      'message': text,
      'isUser': true,
      'label': null,
    });

    isTyping = true;
  });

  symptomController.clear();

  Future.delayed(const Duration(seconds: 2), () {
    if (!mounted) return;

    setState(() {
      isTyping = false;

      messages.add({
        'message':
            'Thanks for sharing your symptoms. I can generate an AI prediction based on what you described.',
        'isUser': false,
        'label': 'AI Assistant',
      });

      showPredictionButton = true;
    });
  });
}

  void addQuickSymptom(String symptom) {
    symptomController.text = symptom;
    symptomController.selection = TextSelection.fromPosition(
      TextPosition(offset: symptomController.text.length),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          _SymptomAnimatedHeader(
            title: 'Symptom Checker',
            subtitle: 'AI-powered health assistant',
            onBackTap: () => Navigator.pop(context),
          ),

          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.fromLTRB(18.w, 22.h, 18.w, 10.h),
              itemCount: messages.length + (isTyping ? 1 : 0),
              itemBuilder: (context, index) {
                if (index == messages.length && isTyping) {
                  return const TypingBubble();
                }

                final item = messages[index];

                return SymptomChatBubble(
                  message: item['message'],
                  isUser: item['isUser'],
                  label: item['label'],
                );
              },
            ),
          ),

          SizedBox(
            height: 58.h,
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              scrollDirection: Axis.horizontal,
              itemCount: quickSymptoms.length,
              separatorBuilder: (_, __) => SizedBox(width: 10.w),
              itemBuilder: (context, index) {
                final symptom = quickSymptoms[index];

                return SymptomQuickChip(
                  text: symptom,
                  onTap: () => addQuickSymptom(symptom),
                );
              },
            ),
          ),
if (showPredictionButton)
  Padding(
    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
    child: CustomButton(
      text: 'AI Prediction',
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const PossibleConditionsScreen(),
          ),
        );
      },
      height: 52.h,
      borderRadius: 18.r,
    ),
  ),
          SymptomInputBar(
            controller: symptomController,
            onSend: sendMessage,
            onMicTap: () {
              debugPrint('Mic tapped');
            },
          ),
        ],
      ),
    );
  }
}

class _SymptomAnimatedHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onBackTap;

  const _SymptomAnimatedHeader({
    required this.title,
    required this.subtitle,
    required this.onBackTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 165.h,
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
              left: 18.w,
              top: 42.h,
              color: Colors.white.withOpacity(0.12),
              duration: const Duration(seconds: 4),
            ),
            CustomAnimatedBubble(
              size: 55.r,
              left: 295.w,
              top: 42.h,
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
                      onTap: onBackTap,
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
                            text: title,
                            color: Colors.white,
                            fontSize: 21.sp,
                            fontWeight: FontWeight.w800,
                          ),
                          SizedBox(height: 4.h),
                          CustomText(
                            text: subtitle,
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
                        Icons.smart_toy_rounded,
                        color: Colors.white,
                        size: 22.sp,
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