
import 'package:ai_vaidya/core/constant/app_color.dart';
import 'package:ai_vaidya/screens/Doctor_section/find_doctor_screen.dart';
import 'package:ai_vaidya/screens/Ai_symptoms_section/symptoms_checker_screen.dart';
import 'package:ai_vaidya/screens/Record_section/health_records_screen.dart';
import 'package:ai_vaidya/screens/Reminders_section/reminders_screen.dart';
import 'package:ai_vaidya/widgets/custom_aniamted_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/feature_card.dart';
import '../widgets/health_card.dart';
import '../widgets/virtual_doctor.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      //bottomNavigationBar: const CustomBottomNav(),

      body: CustomScrollView(
        slivers: [
          /// HEADER
          SliverToBoxAdapter(
            child: CustomTopAnimatedHeader(
              title: 'Hello Hasan 👋',
              subtitle: 'How are you feeling today?',
              height: 415,

              trailing: Icon(
                Icons.account_circle_outlined,
                color: Colors.white,
                size: 36.sp,
              ),

              bottomChild: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  /// TOP HEALTH CARDS
                  Row(
                    children: const [
                      Expanded(
                        child: HealthCard(
                          title: 'BP',
                          value: '120/80',
                          change: '-5%',
                          isUp: false,
                          icon: Icons.monitor_heart_rounded,
                        ),
                      ),

                      SizedBox(width: 12),

                      Expanded(
                        child: HealthCard(
                          title: 'Steps',
                          value: '10,000',
                          change: '+10%',
                          isUp: true,
                          icon: Icons.directions_walk_rounded,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 12.h),

                  const HealthCard(
                    title: 'Sugar',
                    value: 'Normal',
                    change: '+2%',
                    isUp: true,
                    fullWidth: true,
                    icon: Icons.bloodtype_rounded,
                  ),
                ],
              ),
            ),
          ),

          
          /// BODY
          SliverPadding(
            padding: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 10.h),

            sliver: SliverToBoxAdapter(
              child: Transform.translate(
                offset: Offset(0, -40.h),

                child: Column(
                  children: [
                    /// FEATURE GRID
                    GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisSpacing: 12.w,
                      mainAxisSpacing: 12.h,
                      childAspectRatio: 0.95,

                      children:  [
                        FeatureCard(
  title: 'AI Symptom Checker',
  subtitle: 'Check your symptoms',
  icon: Icons.smart_toy_rounded,
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const SymptomCheckerScreen(),
      ),
    );
  },
),

                       FeatureCard(
  title: 'Consult a Doctor',
  subtitle: 'Book appointment',
  icon: Icons.medical_services_rounded,
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const FindDoctorScreen(),
      ),
    );
  },
),

                        FeatureCard(
  title: 'Health Records',
  subtitle: 'Access your history',
  icon: Icons.folder_rounded,
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const HealthRecordsScreen(),
      ),
    );
  },
),

                        FeatureCard(
                          title: 'Reminders & Meds',
                          subtitle: 'Manage medicines',
                          icon: Icons.medication_rounded,
                           onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const RemindersScreen(),
      ),
    );
  },
                          
                        ),
                      ],
                    ),

                    SizedBox(height: 18.h),

                    const VirtualDoctor(),

                    SizedBox(height: 18.h),

                    Row(
                      children: const [
                        Expanded(
                          child: FeatureCard(
                            title: 'Ambulance',
                            subtitle: 'Emergency help',
                            icon: Icons.local_hospital_rounded,
                          ),
                        ),

                        SizedBox(width: 12),

                        Expanded(
                          child: FeatureCard(
                            title: 'Lab Test',
                            subtitle: 'Book lab test',
                            icon: Icons.science_rounded,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 16.h),

                    const FeatureCard(
                      title: 'Appointment Booking',
                      subtitle: 'Schedule your next visit',
                      icon: Icons.calendar_month_rounded,
                      fullWidth: true,
                    ),

                    SizedBox(height: 30.h),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
