import 'package:ai_vaidya/core/constant/app_color.dart';
import 'package:ai_vaidya/screens/Doctor_section/digital_prescription_screen.dart';
import 'package:ai_vaidya/widgets/custom_button.dart';
import 'package:ai_vaidya/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorChatScreen extends StatefulWidget {
  const DoctorChatScreen({super.key});

  @override
  State<DoctorChatScreen> createState() => _DoctorChatScreenState();
}

class _DoctorChatScreenState extends State<DoctorChatScreen> {
  final TextEditingController messageController = TextEditingController();
  final ScrollController scrollController = ScrollController();

  final List<Map<String, dynamic>> messages = [
    {
      'text':
          "Hello! I'm your AI assistant.\nTo help Dr. Carter understand your situation, could you please describe your main symptoms?",
      'isUser': false,
      'label': 'AI Assistant',
      'isImage': false,
    },
    {
      'text':
          "I've been experiencing a persistent cough and shortness of breath for the last week.",
      'isUser': true,
      'label': 'You',
      'isImage': false,
    },
    {
      'text':
          'Thank you. Do you have any recent lab reports or medical images you can share? This would be very helpful for Dr. Carter.',
      'isUser': false,
      'label': 'AI Assistant',
      'isImage': false,
    },
  ];

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

  void sendMessage() {
    final text = messageController.text.trim();

    if (text.isEmpty) return;

    setState(() {
      messages.add({
        'text': text,
        'isUser': true,
        'label': 'You',
        'isImage': false,
      });
    });

    messageController.clear();
    scrollToBottom();
  }

  void sendImageMessage() {
    setState(() {
      messages.add({
        'text':
            'https://images.unsplash.com/photo-1519494026892-80bbd2d6fd0d?w=600',
        'isUser': true,
        'label': 'You',
        'isImage': true,
      });
    });

    scrollToBottom();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff111318),
      resizeToAvoidBottomInset: true,
      body: Column(
        children: [
          const _ChatHeader(),

          Expanded(
            child: ListView(
              controller: scrollController,
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              padding: EdgeInsets.fromLTRB(18.w, 22.h, 18.w, 20.h),
              children: [
                CustomText(
                  text:
                      'Chat started. The AI will assist you first. Dr. Carter will join shortly.',
                  color: const Color(0xffA7B0C0),
                  fontSize: 14.5.sp,
                  fontWeight: FontWeight.w500,
                  textAlign: TextAlign.center,
                  maxLines: 3,
                  height: 1.4,
                ),

                SizedBox(height: 26.h),

                // ...messages.map(
                //   (message) => _ChatBubble(
                //     text: message['text'],
                //     isUser: message['isUser'],
                //     label: message['label'],
                //     isImage: message['isImage'],
                //   ),
                // ),
                ...messages.map((message) {
  if (message['isPrescription'] == true) {
    return Padding(
      padding: EdgeInsets.only(bottom: 24.h),
      child: CustomButton(
        text: 'View Prescription',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const DigitalPrescriptionScreen(),
            ),
          );
        },
        height: 50.h,
        borderRadius: 24.r,
      ),
    );
  }

  return _ChatBubble(
    text: message['text'],
    isUser: message['isUser'],
    label: message['label'],
    isImage: message['isImage'],
  );
}),
              ],
            ),
          ),

          _ChatInputBar(
            controller: messageController,
            onSend: sendMessage,
            onImageTap: sendImageMessage,
          ),
        ],
      ),
    );
  }

  @override
void initState() {
  super.initState();

  Future.delayed(const Duration(seconds: 4), () {
    if (!mounted) return;

    setState(() {
      messages.add({
        'text': 'Prescription Ready',
        'isUser': false,
        'label': 'Dr. Carter',
        'isImage': false,
        'isPrescription': true,
      });
    });

    scrollToBottom();
  });
}
}



class _ChatHeader extends StatelessWidget {
  const _ChatHeader();

  

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(18.w, 48.h, 18.w, 16.h),
      decoration: const BoxDecoration(
        color: Color(0xff111318),
        border: Border(
          bottom: BorderSide(color: Color(0xff232A36)),
        ),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 28.sp,
            ),
          ),

          SizedBox(width: 18.w),

          CircleAvatar(
            radius: 28.r,
            backgroundImage: const NetworkImage(
              'https://images.unsplash.com/photo-1559839734-2b71ea197ec2?w=300',
            ),
          ),

          SizedBox(width: 14.w),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: 'Dr. Emily Carter',
                  color: Colors.white,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w800,
                  maxLines: 1,
                ),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    Container(
                      height: 8.r,
                      width: 8.r,
                      decoration: const BoxDecoration(
                        color: Color(0xff4EDDC0),
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    CustomText(
                      text: 'Active now',
                      color: const Color(0xffA7B0C0),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              ],
            ),
          ),

          Icon(
            Icons.more_vert_rounded,
            color: Colors.white,
            size: 28.sp,
          ),
        ],
      ),
    );
  }
}

class _ChatBubble extends StatelessWidget {
  final String text;
  final bool isUser;
  final String label;
  final bool isImage;

  const _ChatBubble({
    required this.text,
    required this.isUser,
    required this.label,
    required this.isImage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 24.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment:
            isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isUser) ...[
            Container(
              height: 42.r,
              width: 42.r,
              decoration: const BoxDecoration(
                color: Color(0xff2D3C52),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.smart_toy_rounded,
                color: Colors.white70,
                size: 24.sp,
              ),
            ),
            SizedBox(width: 12.w),
          ],

          Flexible(
            child: Column(
              crossAxisAlignment:
                  isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: label,
                  color: const Color(0xffA7B0C0),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                ),

                SizedBox(height: 8.h),

                Container(
                  constraints: BoxConstraints(maxWidth: 280.w),
                  padding: isImage ? EdgeInsets.all(8.w) : EdgeInsets.all(18.w),
                  decoration: BoxDecoration(
                    color: isUser
                        ? AppColors.primary
                        : const Color(0xff334258),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24.r),
                      topRight: Radius.circular(24.r),
                      bottomLeft: Radius.circular(isUser ? 24.r : 0),
                      bottomRight: Radius.circular(isUser ? 0 : 24.r),
                    ),
                  ),
                  child: isImage
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(18.r),
                          child: Image.network(
                            text,
                            height: 150.h,
                            width: 230.w,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                height: 150.h,
                                width: 230.w,
                                color: const Color(0xff1C2635),
                                child: Icon(
                                  Icons.broken_image_rounded,
                                  color: Colors.white54,
                                  size: 42.sp,
                                ),
                              );
                            },
                          ),
                        )
                      : CustomText(
                          text: text,
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          maxLines: 10,
                          height: 1.45,
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

class _ChatInputBar extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSend;
  final VoidCallback onImageTap;

  const _ChatInputBar({
    required this.controller,
    required this.onSend,
    required this.onImageTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(18.w, 12.h, 18.w, 22.h),
      decoration: const BoxDecoration(
        color: Color(0xff111318),
        border: Border(
          top: BorderSide(color: Color(0xff232A36)),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            GestureDetector(
              onTap: onImageTap,
              child: Icon(
                Icons.add_photo_alternate_outlined,
                color: const Color(0xffA7B0C0),
                size: 28.sp,
              ),
            ),

            SizedBox(width: 12.w),

            Expanded(
              child: Container(
                height: 54.h,
                padding: EdgeInsets.symmetric(horizontal: 18.w),
                decoration: BoxDecoration(
                  color: const Color(0xff1C2635),
                  borderRadius: BorderRadius.circular(28.r),
                  border: Border.all(color: const Color(0xff334258)),
                ),
                child: TextField(
                  controller: controller,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Ask Dr. Carter a question.',
                    hintStyle: TextStyle(
                      color: const Color(0xff7F8A9D),
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