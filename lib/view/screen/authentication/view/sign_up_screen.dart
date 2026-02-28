import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../../../components/custom_gradient_button/custom_gradient_button.dart';
import '../../../components/glass_card/glass_card.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFFE0DF), Color(0xFFFFB7B2)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: GlassCard(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text("Create Account", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                    const Text("Join the challenge and level up your life", style: TextStyle(color: Colors.black54)),
                    const SizedBox(height: 20),
                    _buildTextField("Full Name", Icons.person_outline),
                    const SizedBox(height: 12),
                    _buildTextField("Email Address", Icons.email_outlined),
                    const SizedBox(height: 12),
                    _buildTextField("Password", Icons.lock_outline, isPass: true),
                    const SizedBox(height: 24),
                    CustomGradientButton(
                      text: "Get Started",
                      gradient: AppColors.orangeGradient,
                      onPressed: () => Get.offAllNamed('/home_alternative'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Helper method for TextField
  Widget _buildTextField(String hint, IconData icon, {bool isPass = false}) {
    return TextField(
      obscureText: isPass,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Icon(icon, color: Colors.orangeAccent),
        filled: true,
        fillColor: Colors.white.withValues(alpha: 0.5),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
      ),
    );
  }
}