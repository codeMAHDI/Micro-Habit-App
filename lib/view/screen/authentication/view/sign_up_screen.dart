import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/app_routes/app_routes.dart';
import '../../../../utils/app_strings/app_strings.dart';
import '../../../components/custom_text/custom_text.dart';
import '../../../components/custom_text_field/custom_text_field.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        // ── Same gradient as Login ──
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF0D0B2A),
              Color(0xFF1A1040),
              Color(0xFF2D1B55),
              Color(0xFF3B1F7A),
              Color(0xFF4A1FA0),
            ],
            stops: [0.0, 0.25, 0.5, 0.75, 1.0],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
            child: Column(
              children: [
                SizedBox(height: 20.h),

                // ── Main Glass Card ──
                _GlassCard(
                  child: Padding(
                    padding: EdgeInsets.all(28.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Back button
                        GestureDetector(
                          onTap: () => Get.back(),
                          child: Icon(Icons.arrow_back_ios_new_rounded,
                              color: Colors.white.withOpacity(0.6), size: 20),
                        ),

                        SizedBox(height: 16.h),

                        // Title
                        Center(
                          child: CustomText(
                            text: AppStrings.appName,
                            fontSize: 30,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Center(
                          child: CustomText(
                            text: 'Join the challenge and level up your life.',
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.white.withOpacity(0.65),
                            textAlign: TextAlign.center,
                          ),
                        ),

                        SizedBox(height: 32.h),

                        // Full Name
                        CustomText(
                          text: 'FULL NAME',
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: Colors.white.withOpacity(0.55),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(height: 8.h),
                        CustomTextField(
                          textEditingController: nameController,
                          hintText: 'John Doe',
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                          fillColor: Colors.white.withOpacity(0.07),
                          fieldBorderRadius: 30,
                          fieldBorderColor: Colors.white.withOpacity(0.12),
                          cursorColor: Colors.white,
                          hintStyle: TextStyle(
                            color: Colors.white.withOpacity(0.35),
                            fontSize: 15,
                          ),
                          inputTextStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(14),
                            child: Icon(Icons.person_outline,
                                color: Colors.white.withOpacity(0.45), size: 20),
                          ),
                        ),

                        SizedBox(height: 20.h),

                        // Email
                        CustomText(
                          text: 'EMAIL ADDRESS',
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: Colors.white.withOpacity(0.55),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(height: 8.h),
                        CustomTextField(
                          textEditingController: emailController,
                          hintText: 'name@example.com',
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          fillColor: Colors.white.withOpacity(0.07),
                          fieldBorderRadius: 30,
                          fieldBorderColor: Colors.white.withOpacity(0.12),
                          cursorColor: Colors.white,
                          hintStyle: TextStyle(
                            color: Colors.white.withOpacity(0.35),
                            fontSize: 15,
                          ),
                          inputTextStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(14),
                            child: Icon(Icons.email_outlined,
                                color: Colors.white.withOpacity(0.45), size: 20),
                          ),
                        ),

                        SizedBox(height: 20.h),

                        // Password
                        CustomText(
                          text: 'PASSWORD',
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: Colors.white.withOpacity(0.55),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(height: 8.h),
                        CustomTextField(
                          textEditingController: passwordController,
                          hintText: '••••••••',
                          isPassword: true,
                          textInputAction: TextInputAction.done,
                          fillColor: Colors.black.withOpacity(0.22),
                          fieldBorderRadius: 30,
                          fieldBorderColor: Colors.white.withOpacity(0.12),
                          cursorColor: Colors.white,
                          hintStyle: TextStyle(
                            color: Colors.white.withOpacity(0.45),
                            fontSize: 18,
                            letterSpacing: 4,
                          ),
                          inputTextStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(14),
                            child: Icon(Icons.lock_outline,
                                color: Colors.white.withOpacity(0.45), size: 20),
                          ),
                        ),

                        SizedBox(height: 28.h),

                        // Get Started Button — same gradient
                        _GradientButton(
                          title: 'Get Started →',
                          onTap: () => Get.offAllNamed(AppRoutes.main),
                        ),

                        SizedBox(height: 20.h),

                        // Already have account
                        Center(
                          child: GestureDetector(
                            onTap: () => Get.back(),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Already have an account? ',
                                    style: TextStyle(
                                      color: Colors.white.withOpacity(0.55),
                                      fontSize: 13.sp,
                                      fontFamily: 'Manrope',
                                    ),
                                  ),
                                  const TextSpan(
                                    text: 'Log in',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'Manrope',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 36.h),

                // OR CONTINUE WITH
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                          color: Colors.white.withOpacity(0.12), thickness: 1),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      child: CustomText(
                        text: 'OR CONTINUE WITH',
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: Colors.white.withOpacity(0.3),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      child: Divider(
                          color: Colors.white.withOpacity(0.12), thickness: 1),
                    ),
                  ],
                ),

                SizedBox(height: 16.h),

                // Social Buttons
                Row(
                  children: [
                    Expanded(
                      child: _SocialButton(
                        onTap: () {},
                        child: Container(
                          width: 20,
                          height: 20,
                          color: Colors.white,
                          child: const Center(
                            child: Text('G',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    color: Colors.black87)),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 14.w),
                    Expanded(
                      child: _SocialButton(
                        onTap: () {},
                        child: const CustomText(
                          text: 'iOS',
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 28.h),

                // Page dots
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _dot(false),
                    SizedBox(width: 6.w),
                    _dot(false),
                    SizedBox(width: 6.w),
                    _dot(true),
                  ],
                ),

                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _dot(bool active) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: active ? 24 : 8,
      height: 8,
      decoration: BoxDecoration(
        color: active
            ? const Color(0xFF5B6BF5)
            : Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}

// ── Gradient Button (same as Login) ──
class _GradientButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const _GradientButton({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 54.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: const LinearGradient(
            colors: [Color(0xFF4F6EF7), Color(0xFF8B3FE8)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF5B6BF5).withOpacity(0.45),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Center(
          child: CustomText(
            text: title,
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Colors.white,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

// ── Glass Card ──
class _GlassCard extends StatelessWidget {
  final Widget child;
  const _GlassCard({required this.child});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.06),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: Colors.white.withOpacity(0.1)),
          ),
          child: child,
        ),
      ),
    );
  }
}

// ── Social Button ──
class _SocialButton extends StatelessWidget {
  final VoidCallback onTap;
  final Widget child;
  const _SocialButton({required this.onTap, required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            height: 52.h,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.07),
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: Colors.white.withOpacity(0.12)),
            ),
            child: Center(child: child),
          ),
        ),
      ),
    );
  }
}