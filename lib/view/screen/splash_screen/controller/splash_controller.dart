import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:micro_habit/core/app_routes/app_routes.dart';

class SplashController extends GetxController with GetTickerProviderStateMixin {
  // Controllers
  late AnimationController logoController;
  late AnimationController textController;
  late AnimationController progressController;
  late AnimationController glowController;
  late AnimationController quoteController;

  //  Logo
  late Animation<double> logoScale;
  late Animation<double> logoOpacity;
  late Animation<double> glowOpacity;

  // Text
  late Animation<double> titleOpacity;
  late Animation<Offset> titleSlide;
  late Animation<double> subtitleOpacity;
  late Animation<Offset> subtitleSlide;
  late Animation<double> taglineOpacity;

  // Bottom
  late Animation<double> progressOpacity;
  late Animation<double> progressWidth;
  late Animation<double> quoteOpacity;
  late Animation<Offset> quoteSlide;

  @override
  void onInit() {
    super.onInit();
    _initControllers();
    _initAnimations();
    _startSequence();
  }

  void _initControllers() {
    logoController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    textController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    progressController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    );
    glowController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..repeat(reverse: true);
    quoteController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
  }

  void _initAnimations() {
    // Logo
    logoScale = Tween<double>(begin: 0.4, end: 1.0).animate(
      CurvedAnimation(parent: logoController, curve: Curves.elasticOut),
    );
    logoOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: logoController,
        curve: const Interval(0.0, 0.5, curve: Curves.easeIn),
      ),
    );
    glowOpacity = Tween<double>(begin: 0.3, end: 0.85).animate(glowController);

    // Text
    titleOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: textController,
        curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
      ),
    );
    titleSlide = Tween<Offset>(begin: const Offset(0, 0.4), end: Offset.zero)
        .animate(CurvedAnimation(
      parent: textController,
      curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
    ));
    subtitleOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: textController,
        curve: const Interval(0.25, 0.85, curve: Curves.easeOut),
      ),
    );
    subtitleSlide =
        Tween<Offset>(begin: const Offset(0, 0.4), end: Offset.zero).animate(
          CurvedAnimation(
            parent: textController,
            curve: const Interval(0.25, 0.85, curve: Curves.easeOut),
          ),
        );
    taglineOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: textController,
        curve: const Interval(0.55, 1.0, curve: Curves.easeOut),
      ),
    );

    // Progress
    progressOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: progressController,
        curve: const Interval(0.0, 0.2, curve: Curves.easeIn),
      ),
    );
    progressWidth = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: progressController,
        curve: const Interval(0.1, 0.85, curve: Curves.easeInOut),
      ),
    );

    // Quote
    quoteOpacity = Tween<double>(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: quoteController, curve: Curves.easeIn));
    quoteSlide =
        Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero).animate(
          CurvedAnimation(parent: quoteController, curve: Curves.easeOut),
        );
  }

  Future<void> _startSequence() async {
    await Future.delayed(const Duration(milliseconds: 200));
    logoController.forward();

    await Future.delayed(const Duration(milliseconds: 600));
    textController.forward();

    await Future.delayed(const Duration(milliseconds: 600));
    progressController.forward();

    await Future.delayed(const Duration(milliseconds: 800));
    quoteController.forward();

    await Future.delayed(const Duration(milliseconds: 1000));
    Get.offNamed(AppRoutes.login);
  }

  @override
  void onClose() {
    logoController.dispose();
    textController.dispose();
    progressController.dispose();
    glowController.dispose();
    quoteController.dispose();
    super.onClose();
  }
}