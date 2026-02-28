import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:micro_habit/view/components/glass_card/glass_card.dart';
import '../../../../core/app_routes/app_routes.dart';
import '../../../../utils/app_icons/app_icons.dart';
import '../../../../utils/app_strings/app_strings.dart';
import '../../../components/custom_button/custom_button.dart';
import '../../../components/custom_image/custom_image.dart';
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

                GlassCard(
                  child: Padding(
                    padding: EdgeInsets.all(28.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () => Get.back(),
                          child: Icon(Icons.arrow_back_ios_new_rounded,
                              color: Colors.white.withOpacity(0.6), size: 20),
                        ),

                        SizedBox(height: 16.h),
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
                            text: AppStrings.signUpDes,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.white.withOpacity(0.65),
                            textAlign: TextAlign.center,
                          ),
                        ),

                        SizedBox(height: 32.h),

                        // Full Name
                        CustomText(
                          text: AppStrings.fullName,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.white.withOpacity(0.55),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(height: 8.h),
                        CustomTextField(
                          textEditingController: nameController,
                          hintText: AppStrings.fullNameHints,
                          keyboardType: TextInputType.name,
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
                            child: Icon(Icons.person_outline,
                                color: Colors.white.withOpacity(0.45),
                                size: 20),
                          ),
                        ),

                        SizedBox(height: 20.h),

                        // Email
                        CustomText(
                          text: AppStrings.email,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.white.withOpacity(0.55),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(height: 8.h),
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

                        // Password
                        CustomText(
                          text: AppStrings.password,
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: Colors.white.withOpacity(0.55),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(height: 8.h),
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

                        SizedBox(height: 28.h),

                        CustomButton(
                          title: AppStrings.getStarted,
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

                        // Already have account
                        Center(
                          child: GestureDetector(
                            onTap: () => Get.back(),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: AppStrings.alreadyHaveAccount,
                                    style: TextStyle(
                                      color: Colors.white.withOpacity(0.55),
                                      fontSize: 12.sp,
                                      fontFamily: 'Manrope',
                                    ),
                                  ),
                                  const TextSpan(
                                    text: AppStrings.loginBtnTxt,
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

                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
