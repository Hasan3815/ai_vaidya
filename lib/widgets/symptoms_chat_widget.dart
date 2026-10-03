import 'package:ai_vaidya/core/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_text.dart';

class SymptomChatBubble extends StatelessWidget {
  final String message;
  final bool isUser;
  final String? label;

  const SymptomChatBubble({
    super.key,
    required this.message,
    required this.isUser,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 22.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment:
            isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isUser) ...[
            const AiAvatar(),
            SizedBox(width: 12.w),
          ],

          Flexible(
            child: Column(
              crossAxisAlignment:
                  isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                if (label != null) ...[
                  CustomText(
                    text: label!,
                    fontSize: 14.sp,
                    color: AppColors.textSecondary,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(height: 8.h),
                ],

                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 16.h,
                  ),
                  decoration: BoxDecoration(
                    color: isUser
                        ? AppColors.primary.withOpacity(0.12)
                        : Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(28.r),
                      topRight: Radius.circular(28.r),
                      bottomLeft: Radius.circular(isUser ? 28.r : 0),
                      bottomRight: Radius.circular(isUser ? 0 : 28.r),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.04),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: CustomText(
                    text: message,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textPrimary,
                    maxLines: 10,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AiAvatar extends StatelessWidget {
  const AiAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 25.r,
      backgroundColor: AppColors.primary.withOpacity(0.12),
      child: Icon(
        Icons.health_and_safety_rounded,
        color: AppColors.primary,
        size: 26.sp,
      ),
    );
  }
}

class TypingBubble extends StatefulWidget {
  const TypingBubble({super.key});

  @override
  State<TypingBubble> createState() => _TypingBubbleState();
}

class _TypingBubbleState extends State<TypingBubble>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget dot(int index) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        final value = (controller.value + index * 0.25) % 1;

        return Opacity(
          opacity: value < 0.5 ? 1 : 0.35,
          child: Container(
            width: 9.w,
            height: 9.w,
            margin: EdgeInsets.symmetric(horizontal: 3.w),
            decoration: BoxDecoration(
              color: Colors.grey.shade500,
              shape: BoxShape.circle,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const AiAvatar(),
        SizedBox(width: 12.w),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: 'AI Assistant is typing...',
              fontSize: 14.sp,
              color: AppColors.textSecondary,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(height: 8.h),

            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 18.w,
                vertical: 14.h,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  dot(0),
                  dot(1),
                  dot(2),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class SymptomQuickChip extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;

  const SymptomQuickChip({
    super.key,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 24.w,
          vertical: 13.h,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30.r),
          border: Border.all(
            color: Colors.grey.shade300,
          ),
        ),
        child: CustomText(
          text: text,
          fontSize: 15.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.textPrimary,
        ),
      ),
    );
  }
}

class SymptomInputBar extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSend;
  final VoidCallback? onMicTap;

  const SymptomInputBar({
    super.key,
    required this.controller,
    required this.onSend,
    this.onMicTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(18.w, 10.h, 18.w, 22.h),
      decoration: BoxDecoration(
        color: AppColors.background,
        border: Border(
          top: BorderSide(
            color: Colors.grey.shade300,
          ),
        ),
      ),
      child: Container(
        height: 60.h,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(35.r),
        ),
        child: Row(
          children: [
            GestureDetector(
              onTap: onMicTap,
              child: Icon(
                Icons.mic_none_rounded,
                size: 28.sp,
                color: AppColors.textSecondary,
              ),
            ),

            SizedBox(width: 12.w),

            Expanded(
              child: TextField(
                controller: controller,
                cursorColor: AppColors.primary,
                style: TextStyle(
                  fontSize: 16.sp,
                  color: AppColors.textPrimary,
                ),
                decoration: InputDecoration(
                  hintText: 'Type your symptoms...',
                  hintStyle: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.grey.shade500,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),

            GestureDetector(
              onTap: onSend,
              child: CircleAvatar(
                radius: 25.r,
                backgroundColor: AppColors.primary,
                child: Icon(
                  Icons.send_rounded,
                  color: Colors.white,
                  size: 24.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}