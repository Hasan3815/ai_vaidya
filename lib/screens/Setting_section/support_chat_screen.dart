import 'package:ai_vaidya/core/constant/app_color.dart';
import 'package:ai_vaidya/widgets/animated_wave.dart';
import 'package:ai_vaidya/widgets/custom_animated_bubble.dart';
import 'package:ai_vaidya/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SupportChatScreen extends StatefulWidget {
  const SupportChatScreen({super.key});

  @override
  State<SupportChatScreen> createState() => _SupportChatScreenState();
}

class _SupportChatScreenState extends State<SupportChatScreen> {
  final TextEditingController messageController = TextEditingController();
  final ScrollController scrollController = ScrollController();

  final List<_SupportMessage> messages = [
    _SupportMessage(
      text:
          "Hi! I'm your virtual assistant. How can I help you with your account today?",
      isUser: false,
      sender: 'Support Assistant',
    ),
  ];

  final List<String> quickReplies = [
    'Reset my password',
    'I forgot my username',
    'My account is locked',
  ];

  bool isTyping = false;
  bool showHelpCard = false;

  @override
  void dispose() {
    messageController.dispose();
    scrollController.dispose();
    super.dispose();
  }

  void scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 120), () {
      if (!scrollController.hasClients) return;

      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeOut,
      );
    });
  }

  void sendMessage([String? quickText]) {
    final text = quickText ?? messageController.text.trim();

    if (text.isEmpty) return;

    setState(() {
      messages.add(
        _SupportMessage(
          text: text,
          isUser: true,
          sender: 'You',
        ),
      );
      messageController.clear();
      isTyping = true;
    });

    scrollToBottom();

    Future.delayed(const Duration(seconds: 1), () {
      if (!mounted) return;

      setState(() {
        isTyping = false;
        showHelpCard = true;
        messages.add(
          _SupportMessage(
            text:
                'I can help you reset your password. Please check the guide below.',
            isUser: false,
            sender: 'Support Assistant',
            showCard: true,
          ),
        );
      });

      scrollToBottom();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      resizeToAvoidBottomInset: true,
      body: Column(
        children: [
          const _SupportChatHeader(),

          Expanded(
            child: ListView(
              controller: scrollController,
              padding: EdgeInsets.fromLTRB(16.w, 22.h, 16.w, 18.h),
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              children: [
                ...messages.asMap().entries.map((entry) {
                  final index = entry.key;
                  final message = entry.value;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _ChatMessageBubble(message: message),
                      if (index == 0) ...[
                        SizedBox(height: 16.h),
                        _QuickReplies(
                          replies: quickReplies,
                          onTap: sendMessage,
                        ),
                      ],
                    ],
                  );
                }),

                if (isTyping) ...[
                  SizedBox(height: 4.h),
                  const _TypingBubble(),
                ],
              ],
            ),
          ),

          _ChatInputBar(
            controller: messageController,
            onSend: () => sendMessage(),
          ),
        ],
      ),
    );
  }
}

class _SupportChatHeader extends StatelessWidget {
  const _SupportChatHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 135.h,
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
              size: 80.r,
              left: 20.w,
              top: 35.h,
              color: Colors.white.withOpacity(0.12),
              duration: const Duration(seconds: 4),
            ),
            CustomAnimatedBubble(
              size: 56.r,
              left: 295.w,
              top: 38.h,
              color: Colors.white.withOpacity(0.16),
              duration: const Duration(seconds: 3),
            ),
            Positioned(
              bottom: -48.h,
              left: 0,
              right: 0,
              child: AnimatedWave(
                color: Colors.white.withOpacity(0.15),
                height: 90.h,
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                            text: 'Support Assistant',
                            color: Colors.white,
                            fontSize: 21.sp,
                            fontWeight: FontWeight.w700,
                          ),
                          SizedBox(height: 4.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 8.r,
                                width: 8.r,
                                decoration: const BoxDecoration(
                                  color: Color(0xff21C45D),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              SizedBox(width: 7.w),
                              CustomText(
                                text: 'Online',
                                color: Colors.white.withOpacity(0.90),
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ],
                          ),
                        ],
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
                        Icons.more_vert_rounded,
                        color: Colors.white,
                        size: 24.sp,
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

class _QuickReplies extends StatelessWidget {
  final List<String> replies;
  final ValueChanged<String> onTap;

  const _QuickReplies({
    required this.replies,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 58.w),
      child: Wrap(
        spacing: 10.w,
        runSpacing: 10.h,
        children: replies.map((reply) {
          return GestureDetector(
            onTap: () => onTap(reply),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 10.h,
              ),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.10),
                borderRadius: BorderRadius.circular(24.r),
              ),
              child: CustomText(
                text: reply,
                color: AppColors.primary,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class _ChatMessageBubble extends StatelessWidget {
  final _SupportMessage message;

  const _ChatMessageBubble({
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    final isUser = message.isUser;

    return Padding(
      padding: EdgeInsets.only(bottom: 18.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment:
            isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isUser) ...[
            _Avatar(
              icon: Icons.support_agent_rounded,
              color: AppColors.primary,
            ),
            SizedBox(width: 10.w),
          ],

          Flexible(
            child: Column(
              crossAxisAlignment:
                  isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: message.sender,
                  color: AppColors.textSecondary,
                  fontSize: 12.5.sp,
                  fontWeight: FontWeight.w500,
                ),

                SizedBox(height: 6.h),

                Container(
                  constraints: BoxConstraints(maxWidth: 285.w),
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: isUser ? AppColors.primary : Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24.r),
                      topRight: Radius.circular(24.r),
                      bottomLeft: Radius.circular(isUser ? 24.r : 0),
                      bottomRight: Radius.circular(isUser ? 0 : 24.r),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.04),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: CustomText(
                    text: message.text,
                    color: isUser ? Colors.white : AppColors.textPrimary,
                    fontSize: 15.5.sp,
                    fontWeight: FontWeight.w500,
                    maxLines: 8,
                    height: 1.45,
                  ),
                ),

                if (message.showCard) ...[
                  SizedBox(height: 12.h),
                  const _PasswordResetCard(),
                ],
              ],
            )
          ),
          

          if (isUser) ...[
            SizedBox(width: 10.w),
            _Avatar(
              icon: Icons.person_rounded,
              color: const Color(0xff4EDDC0),
            ),
          ],
        ],
      ),
    );
  }
}

class _PasswordResetCard extends StatelessWidget {
  const _PasswordResetCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 285.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.045),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 130.h,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: AppColors.primaryGradient,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(22.r),
              ),
            ),
            child: Icon(
              Icons.lock_reset_rounded,
              color: Colors.white,
              size: 58.sp,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: 'Password Reset',
                  color: AppColors.textPrimary,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                ),
                SizedBox(height: 8.h),
                CustomText(
                  text:
                      'Let’s get you back into your account. Open the reset guide and follow the steps.',
                  color: AppColors.textSecondary,
                  fontSize: 13.5.sp,
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

class _TypingBubble extends StatelessWidget {
  const _TypingBubble();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _Avatar(
          icon: Icons.support_agent_rounded,
          color: AppColors.primary,
        ),
        SizedBox(width: 10.w),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 12.h,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(22.r),
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
              _typingDot(),
              SizedBox(width: 5.w),
              _typingDot(),
              SizedBox(width: 5.w),
              _typingDot(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _typingDot() {
    return Container(
      height: 8.r,
      width: 8.r,
      decoration: BoxDecoration(
        color: AppColors.textSecondary,
        shape: BoxShape.circle,
      ),
    );
  }
}

class _ChatInputBar extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSend;

  const _ChatInputBar({
    required this.controller,
    required this.onSend,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 22.h),
      decoration: BoxDecoration(
        color: AppColors.background,
        border: Border(
          top: BorderSide(color: Colors.grey.shade300),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            Icon(
              Icons.add_photo_alternate_outlined,
              color: AppColors.textSecondary,
              size: 28.sp,
            ),

            SizedBox(width: 12.w),

            Expanded(
              child: Container(
                height: 54.h,
                padding: EdgeInsets.symmetric(horizontal: 18.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(28.r),
                  border: Border.all(
                    color: AppColors.primary.withOpacity(0.14),
                  ),
                ),
                child: TextField(
                  controller: controller,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: AppColors.textPrimary,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Type your message...',
                    hintStyle: TextStyle(
                      fontFamily: 'Poppins',
                      color: AppColors.textSecondary,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    border: InputBorder.none,
                  ),
                  onSubmitted: (_) => onSend(),
                ),
              ),
            ),

            SizedBox(width: 12.w),

            GestureDetector(
              onTap: onSend,
              child: Container(
                height: 54.r,
                width: 54.r,
                decoration: BoxDecoration(
                  gradient: AppColors.primaryGradient,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.send_rounded,
                  color: Colors.white,
                  size: 26.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Avatar extends StatelessWidget {
  final IconData icon;
  final Color color;

  const _Avatar({
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.r,
      width: 40.r,
      decoration: BoxDecoration(
        color: color.withOpacity(0.14),
        shape: BoxShape.circle,
        border: Border.all(
          color: color.withOpacity(0.25),
        ),
      ),
      child: Icon(
        icon,
        color: color,
        size: 22.sp,
      ),
    );
  }
}

class _SupportMessage {
  final String text;
  final bool isUser;
  final String sender;
  final bool showCard;

  _SupportMessage({
    required this.text,
    required this.isUser,
    required this.sender,
    this.showCard = false,
  });
}