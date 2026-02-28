// lib/view/screen/splash_screen/splash_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/app_colors/app_colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ২ সেকেন্ড পর লগইন স্ক্রিনে নিয়ে যাবে
    Future.delayed(const Duration(seconds: 2), () => Get.offNamed('/login'));

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(gradient: AppColors.primaryGradient),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.auto_awesome, size: 80, color: Colors.white),
            SizedBox(height: 20),
            Text(
              "MicroHabit",
              style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold, letterSpacing: 2),
            ),
          ],
        ),
      ),
    );
  }
}