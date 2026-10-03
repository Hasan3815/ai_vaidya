import 'package:ai_vaidya/core/constant/app_color.dart';
import 'package:ai_vaidya/model/doctor_model.dart';
import 'package:ai_vaidya/screens/Doctor_section/doctor_detail_screen.dart';
import 'package:ai_vaidya/widgets/custom_text.dart';
import 'package:ai_vaidya/widgets/doctor_card.dart';
import 'package:ai_vaidya/widgets/doctor_filter_chip.dart';
import 'package:ai_vaidya/widgets/doctor_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FindDoctorScreen extends StatefulWidget {
  final VoidCallback? onBackToHome;
  const FindDoctorScreen({super.key,this.onBackToHome,});

  @override
  State<FindDoctorScreen> createState() => _FindDoctorScreenState();
}

class _FindDoctorScreenState extends State<FindDoctorScreen> {
  int selectedCategory = 0;

  final List<String> categories = [
    'All',
    'General',
    'Dermatology',
    'Cardiology',
    'Pediatrics',
  ];

  final List<DoctorModel> doctors = const [
    DoctorModel(
      name: 'Dr. Evelyn Reed',
      specialty: 'Dermatology',
      experience: '12 yrs',
      rating: '4.8',
      reviews: '212',
      imageUrl:
          'https://images.unsplash.com/photo-1559839734-2b71ea197ec2?w=300',
      availability: 'Available Now',
      isAvailableNow: true,
    ),
    DoctorModel(
      name: 'Dr. Marcus Chen',
      specialty: 'Cardiology',
      experience: '15 yrs',
      rating: '4.9',
      reviews: '305',
      imageUrl:
          'https://images.unsplash.com/photo-1622253692010-333f2da6031d?w=300',
      availability: 'Next: 3:00 PM',
      isAvailableNow: false,
    ),
    DoctorModel(
      name: 'Dr. Isabella Rossi',
      specialty: 'Pediatrics',
      experience: '8 yrs',
      rating: '4.7',
      reviews: '189',
      imageUrl:
          'https://images.unsplash.com/photo-1594824476967-48c8b964273f?w=300',
      availability: 'Available Now',
      isAvailableNow: true,
    ),
  ];

  List<DoctorModel> get filteredDoctors {
    final selected = categories[selectedCategory];

    if (selected == 'All') return doctors;

    return doctors.where((doctor) {
      return doctor.specialty.toLowerCase() == selected.toLowerCase();
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          const DoctorHeader(),

          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(16.w, 18.h, 16.w, 20.h),
              child: Column(
                children: [
                  Container(
                    height: 56.h,
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(22.r),
                      border: Border.all(color: Colors.grey.shade300),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.035),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.search_rounded,
                          color: Colors.grey.shade600,
                          size: 26.sp,
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Search by name or specialty...',
                              hintStyle: TextStyle(
                                fontSize: 15.sp,
                                color: Colors.grey.shade500,
                                fontWeight: FontWeight.w500,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 18.h),

                  SizedBox(
                    height: 52.h,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      separatorBuilder: (_, __) => SizedBox(width: 10.w),
                      itemBuilder: (context, index) {
                        return DoctorFilterChip(
                          title: categories[index],
                          isSelected: selectedCategory == index,
                          onTap: () {
                            setState(() {
                              selectedCategory = index;
                            });
                          },
                        );
                      },
                    ),
                  ),

                  SizedBox(height: 24.h),

                  if (filteredDoctors.isEmpty)
                    Padding(
                      padding: EdgeInsets.only(top: 60.h),
                      child: CustomText(
                        text: 'No doctors found',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textSecondary,
                      ),
                    )
                  else
                    ...filteredDoctors.map(
                      (doctor) => 
                      DoctorCard(
  doctor: doctor,
  onBookTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => DoctorDetailScreen(doctor: doctor),
      ),
    );
  },
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