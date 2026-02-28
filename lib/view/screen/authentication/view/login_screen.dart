import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/app_routes/app_routes.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../../../components/custom_gradient_button/custom_gradient_button.dart';
import '../../../components/glass_card/glass_card.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(gradient: AppColors.primaryGradient),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GlassCard(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    children: [
                      const Text("MicroHabit", style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)),
                      const Text("Build greatness, one tiny step at a time.",
                          textAlign: TextAlign.center, style: TextStyle(color: Colors.white70)),
                      const SizedBox(height: 30),
                      // Email Field
                      TextField(
                        decoration: InputDecoration(
                          hintText: "Email Address",
                          hintStyle: const TextStyle(color: Colors.white60),
                          prefixIcon: const Icon(Icons.email_outlined, color: Colors.white70),
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.05),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Login Button
                      Container(
                        width: double.infinity,
                        height: 55,
                        decoration: BoxDecoration(
                          gradient: AppColors.tealGradient,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: CustomGradientButton(
                          text: "Log In",
                          gradient: AppColors.tealGradient,
                          onPressed: () {
                            // Get.offAllNamed ব্যবহার করলে লগইন করার পর আর ব্যাকে আসা যাবে না (Best Practice)
                            Get.offAllNamed(AppRoutes.main);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}