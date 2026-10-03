

// import 'package:ai_vaidya/dashboard.dart';
// import 'package:flutter/material.dart';

// void main() {
//   runApp(
//     MaterialApp(
//       home:HomeScreen()
//     )
//   );
// }

import 'package:ai_vaidya/providers/health_record_provider.dart';
import 'package:ai_vaidya/providers/profile_provider.dart';
import 'package:ai_vaidya/providers/reminder_provider.dart';
import 'package:ai_vaidya/screens/onboarding_section/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';


void main() {
 runApp(
  MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ReminderProvider()),
      ChangeNotifierProvider(create: (_) => ProfileProvider()),
      ChangeNotifierProvider(create: (_) => HealthRecordProvider()),
    ],
    child: const AiVaidyaApp(),
  ),
);
}

class AiVaidyaApp extends StatelessWidget {
  const AiVaidyaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Ai Vaidya',
          theme: ThemeData(
            useMaterial3: true,
            fontFamily: 'Poppins',
          ),
          home: const SplashScreen(),
        );
      },
    );
  }
}