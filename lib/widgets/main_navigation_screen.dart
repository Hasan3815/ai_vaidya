

import 'package:ai_vaidya/screens/Doctor_section/%20find_doctor_screen.dart';
import 'package:ai_vaidya/screens/Profile_section/profile_screen.dart';
import 'package:ai_vaidya/screens/Setting_section/setting_screen.dart';
import 'package:ai_vaidya/screens/home_dashboard.dart';
import 'package:ai_vaidya/widgets/custom_bottom_nav.dart';
import 'package:flutter/material.dart';

class MainNavigationScreen extends StatefulWidget {
 
  const MainNavigationScreen({super.key,});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

// class _MainNavigationScreenState extends State<MainNavigationScreen> {
//   int currentIndex = 0;

//   final List<Widget> screens = const [
//     HomeScreen(),
//     FindDoctorScreen(),
//     HealthRecordsScreen(),
//     ProfileScreen(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return PopScope(
//       canPop: currentIndex == 0,
//       onPopInvokedWithResult: (didPop, result) {
//         if (didPop) return;

//         setState(() {
//           currentIndex = 0;
//         });
//       },
//       child: Scaffold(
//         body: IndexedStack(
//           index: currentIndex,
//           children: screens,
//         ),
//         bottomNavigationBar: CustomBottomNav(
//           currentIndex: currentIndex,
//           onTap: (index) {
//             setState(() {
//               currentIndex = index;
//             });
//           },
//         ),
//       ),
//     );
//   }
// }

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int currentIndex = 0;

  void changeTab(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screens = [
      const HomeScreen(),
      FindDoctorScreen(onBackToHome: () => changeTab(0)),
      SettingsScreen(),
      ProfileScreen(onBackToHome: () => changeTab(0)),
    ];

    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: CustomBottomNav(
        currentIndex: currentIndex,
        onTap: changeTab,
      ),
    );
  }
}