import 'package:envapp/share/app_colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'pages/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Green Environment',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Agency',
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: AppColors.lightGreen,
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
