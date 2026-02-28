import 'package:flutter/material.dart';
import 'package:micro_habit/utils/app_strings/app_strings.dart';

import '../../../components/custom_text/custom_text.dart';
import '../controller/splash_controller.dart';

class SplashTitle extends StatelessWidget {
  final SplashController c;
  const SplashTitle({super.key, required this.c});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: c.textController,
      builder: (context, _) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // "MicroHabit"
            SlideTransition(
              position: c.titleSlide,
              child: Opacity(
                opacity: c.titleOpacity.value,
                child: const CustomText(
                  text: AppStrings.appName,
                  fontSize: 36,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  textAlign: TextAlign.center,
                ),
              ),
            ),

            SlideTransition(
              position: c.subtitleSlide,
              child: Opacity(
                opacity: c.subtitleOpacity.value,
                child: ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: [Color(0xFF4F8EF7), Color(0xFF6B4FE8)],
                  ).createShader(bounds),
                  child: const CustomText(
                    text: AppStrings.challenge,
                    fontSize: 36,
                    fontWeight: FontWeight.w700,
                    color: Colors.white, // white must for ShaderMask
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 12),

            // Tagline
            Opacity(
              opacity: c.taglineOpacity.value,
              child: CustomText(
                text: AppStrings.theArtOfSmallWins,
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: Colors.white.withOpacity(0.45),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        );
      },
    );
  }
}