import 'package:ai_vaidya/core/constant/app_color.dart';
import 'package:ai_vaidya/screens/onboarding_section/login_register_screen.dart';
import 'package:ai_vaidya/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController logoController;
  late final AnimationController pulseController;
  late final AnimationController lineController;

  late final Animation<double> logoScale;
  late final Animation<double> logoOpacity;
  late final Animation<double> textOpacity;
  late final Animation<double> lineAnimation;

  @override
  void initState() {
    super.initState();

    logoController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1100),
    );

    pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat(reverse: true);

    lineController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1300),
    );

    logoScale = Tween<double>(begin: 0.75, end: 1).animate(
      CurvedAnimation(
        parent: logoController,
        curve: Curves.easeOutBack,
      ),
    );

    logoOpacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: logoController,
        curve: Curves.easeOut,
      ),
    );

    textOpacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: logoController,
        curve: const Interval(0.45, 1, curve: Curves.easeOut),
      ),
    );

    lineAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: lineController,
        curve: Curves.easeInOut,
      ),
    );

    logoController.forward();
    lineController.forward();

    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const LoginRegisterScreen(),
        ),
      );
    });
  }

  @override
  void dispose() {
    logoController.dispose();
    pulseController.dispose();
    lineController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffDDF1FF),
      body: Stack(
        children: [
          Positioned(
            top: 110.h,
            right: -45.w,
            child: _SoftCircle(size: 150.r),
          ),

          Positioned(
            bottom: 80.h,
            left: -55.w,
            child: _SoftCircle(size: 180.r),
          ),

          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FadeTransition(
                  opacity: logoOpacity,
                  child: ScaleTransition(
                    scale: logoScale,
                    child: AnimatedBuilder(
                      animation: pulseController,
                      builder: (context, child) {
                        return Transform.scale(
                          scale: 1 + (pulseController.value * 0.04),
                          child: child,
                        );
                      },
                      child: Container(
                        height: 150.r,
                        width: 150.r,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.primary.withOpacity(0.18),
                              blurRadius: 28,
                              offset: const Offset(0, 12),
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.medical_services_rounded,
                          color: AppColors.primary,
                          size: 76.sp,
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 70.h),

                AnimatedBuilder(
                  animation: lineAnimation,
                  builder: (context, child) {
                    return CustomPaint(
                      size: Size(double.infinity, 70.h),
                      painter: _HeartbeatPainter(
                        progress: lineAnimation.value,
                        color: AppColors.primary,
                      ),
                    );
                  },
                ),

                SizedBox(height: 28.h),

                FadeTransition(
                  opacity: textOpacity,
                  child: Column(
                    children: [
                      CustomText(
                        text: 'AI Doctor +',
                        color: AppColors.textPrimary,
                        fontSize: 34.sp,
                        fontWeight: FontWeight.w700,
                      ),
                      SizedBox(height: 10.h),
                      CustomText(
                        text: 'Your 24x7 Digital Doctor.',
                        color: AppColors.textSecondary,
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
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

class _SoftCircle extends StatelessWidget {
  final double size;

  const _SoftCircle({
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.35),
        shape: BoxShape.circle,
      ),
    );
  }
}

class _HeartbeatPainter extends CustomPainter {
  final double progress;
  final Color color;

  _HeartbeatPainter({
    required this.progress,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final path = Path();

    final y = size.height / 2;

    path.moveTo(0, y);
    path.lineTo(size.width * 0.18, y);
    path.lineTo(size.width * 0.22, y - 25);
    path.lineTo(size.width * 0.27, y + 28);
    path.lineTo(size.width * 0.33, y);
    path.lineTo(size.width * 0.40, y);
    path.lineTo(size.width * 0.46, y - 14);
    path.lineTo(size.width * 0.52, y + 17);
    path.lineTo(size.width * 0.58, y);
    path.lineTo(size.width, y);

    final metric = path.computeMetrics().first;
    final animatedPath = metric.extractPath(
      0,
      metric.length * progress,
    );

    canvas.drawPath(animatedPath, paint);
  }

  @override
  bool shouldRepaint(covariant _HeartbeatPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}