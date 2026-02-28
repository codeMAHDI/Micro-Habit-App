import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:micro_habit/utils/app_icons/app_icons.dart';
import 'package:micro_habit/view/components/custom_image/custom_image.dart';
import 'package:micro_habit/view/components/glass_card/glass_card.dart';
import '../../../../core/app_routes/app_routes.dart';
import '../../../../utils/app_strings/app_strings.dart';
import '../../../components/custom_button/custom_button.dart';
import '../../../components/custom_text/custom_text.dart';
import '../../../components/custom_text_field/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
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
                SizedBox(height: 80.h),

                GlassCard(
                  child: Padding(
                    padding: EdgeInsets.all(28.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                            text: AppStrings.appDes,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.white.withOpacity(0.65),
                            textAlign: TextAlign.center,
                          ),
                        ),

                        SizedBox(height: 32.h),

                        // Email Label
                        CustomText(
                          text: AppStrings.email,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.white.withOpacity(0.55),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(height: 8.h),

                        // Email Field
                        CustomTextField(
                          textEditingController: emailController,
                          hintText: AppStrings.emailHits,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          fillColor: Colors.white.withOpacity(0.07),
                          fieldBorderRadius: 30,
                          fieldBorderColor: Colors.white.withOpacity(0.12),
                          cursorColor: Colors.white,
                          hintStyle: TextStyle(
                            color: Colors.white.withOpacity(0.35),
                            fontSize: 12,
                          ),
                          inputTextStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(14),
                            child: Icon(Icons.email_outlined,
                                color: Colors.white.withOpacity(0.45),
                                size: 16),
                          ),
                        ),

                        SizedBox(height: 20.h),

                        // Password Label
                        CustomText(
                          text: AppStrings.password,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.white.withOpacity(0.55),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(height: 8.h),

                        // Password Field
                        CustomTextField(
                          textEditingController: passwordController,
                          hintText: AppStrings.passHint,
                          isPassword: true,
                          textInputAction: TextInputAction.done,
                          fillColor: Colors.white.withOpacity(0.07),
                          fieldBorderRadius: 30,
                          fieldBorderColor: Colors.white.withOpacity(0.12),
                          cursorColor: Colors.white,
                          hintStyle: TextStyle(
                            color: Colors.white.withOpacity(0.45),
                            fontSize: 12,
                          ),
                          inputTextStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(14),
                            child: Icon(Icons.lock_outline,
                                color: Colors.white.withOpacity(0.45),
                                size: 20),
                          ),
                        ),

                        // Forgot password
                        Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: () {},
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 4),
                              child: CustomText(
                                text: AppStrings.forgotPass,
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFF5B8DEF),
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: 16.h),

                        CustomButton(
                          title: AppStrings.login,
                          height: 54,
                          borderRadius: 30,
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
                          onTap: () => Get.offAllNamed(AppRoutes.main),
                        ),

                        SizedBox(height: 20.h),

                        Center(
                          child: GestureDetector(
                            onTap: () => Get.toNamed(AppRoutes.signup),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: AppStrings.signUp,
                                    style: TextStyle(
                                      color: Colors.white.withOpacity(0.55),
                                      fontSize: 12.sp,
                                      fontFamily: 'Manrope',
                                    ),
                                  ),
                                  const TextSpan(
                                    text: AppStrings.signUpForFree,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
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

                Row(
                  children: [
                    Expanded(
                      child: Divider(
                          color: Colors.white.withOpacity(0.12), thickness: 1),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      child: CustomText(
                        text: AppStrings.continueWith,
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
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                          onTap: () {
                            print("Google tapped");
                          },
                          child: CustomImage(
                              imageSrc: AppIcons.google, width: 20, height: 20))
                    ],
                  ),
                ),

                SizedBox(height: 28.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
