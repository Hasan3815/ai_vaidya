import 'package:ai_vaidya/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({super.key});

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.of(context).padding;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            'https://images.unsplash.com/photo-1559839734-2b71ea197ec2?w=1200',
            fit: BoxFit.cover,
            alignment: Alignment.center,
          ),

          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0.45),
                  Colors.transparent,
                  Colors.black.withOpacity(0.65),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          Positioned(
            top: padding.top + 18.h,
            left: 18.w,
            right: 18.w,
            child: Row(
              children: [
                _CircleButton(
                  icon: Icons.keyboard_arrow_down_rounded,
                  onTap: () => Navigator.pop(context),
                ),
                SizedBox(width: 14.w),
                Expanded(
                  child: CustomText(
                    text: 'Dr. Emily Carter',
                    color: Colors.white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w800,
                    maxLines: 1,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 9.h),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.22),
                    borderRadius: BorderRadius.circular(24.r),
                  ),
                  child: CustomText(
                    text: '12:34',
                    color: Colors.white,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),

          Positioned(
            top: padding.top + 120.h,
            right: 18.w,
            child: Container(
              height: 165.h,
              width: 120.w,
              decoration: BoxDecoration(
                color: const Color(0xffF5CFC5),
                borderRadius: BorderRadius.circular(28.r),
                border: Border.all(color: Colors.white.withOpacity(0.35), width: 2),
              ),
              child: Icon(
                Icons.person_rounded,
                size: 62.sp,
                color: Colors.black.withOpacity(0.45),
              ),
            ),
          ),

          Positioned(
            left: 18.w,
            right: 18.w,
            bottom: padding.bottom + 22.h,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.58),
                borderRadius: BorderRadius.circular(42.r),
              ),
              child: Row(
                children: [
                  _CallButton(icon: Icons.mic_rounded),
                  SizedBox(width: 10.w),
                  _CallButton(icon: Icons.videocam_off_rounded),
                  SizedBox(width: 10.w),
                  _CallButton(icon: Icons.screen_share_rounded),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        height: 56.h,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(32.r),
                        ),
                        child: Icon(
                          Icons.call_end_rounded,
                          color: Colors.white,
                          size: 28.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CircleButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _CircleButton({
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 48.r,
        width: 48.r,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.22),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.white, size: 30.sp),
      ),
    );
  }
}

class _CallButton extends StatelessWidget {
  final IconData icon;

  const _CallButton({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.r,
      width: 48.r,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.22),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: Colors.white, size: 24.sp),
    );
  }
}