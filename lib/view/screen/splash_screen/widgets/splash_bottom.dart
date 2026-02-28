import 'package:flutter/material.dart';
import 'package:micro_habit/utils/app_strings/app_strings.dart';
import '../../../components/custom_text/custom_text.dart';
import '../controller/splash_controller.dart';

class SplashBottom extends StatelessWidget {
  final SplashController c;
  const SplashBottom({super.key, required this.c});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // Progress bar
          AnimatedBuilder(
            animation: c.progressController,
            builder: (context, _) {
              return Opacity(
                opacity: c.progressOpacity.value,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: AppStrings.initializingExperience,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Colors.white.withOpacity(0.7),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: 10),
                    _ProgressBar(widthFactor: c.progressWidth.value),
                  ],
                ),
              );
            },
          ),

          const SizedBox(height: 20),

          // Quote
          AnimatedBuilder(
            animation: c.quoteController,
            builder: (context, _) {
              return SlideTransition(
                position: c.quoteSlide,
                child: Opacity(
                  opacity: c.quoteOpacity.value,
                  child: CustomText(
                    text: AppStrings.quote,
                    fontSize: 11.5,
                    fontWeight: FontWeight.w300,
                    color: Colors.white.withOpacity(0.28),
                    textAlign: TextAlign.center,
                    bottom: 24,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _ProgressBar extends StatelessWidget {
  final double widthFactor;
  const _ProgressBar({required this.widthFactor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 3,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(2),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: FractionallySizedBox(
          widthFactor: widthFactor,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              gradient: const LinearGradient(
                colors: [Color(0xFF4F8EF7), Color(0xFF8B5CF6)],
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF6B4FE8).withOpacity(0.7),
                  blurRadius: 6,
                  spreadRadius: 1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}