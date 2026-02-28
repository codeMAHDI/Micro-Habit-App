import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/splash_controller.dart';
import '../widgets/splash_bottom.dart';
import '../widgets/splash_logo.dart';
import '../widgets/splash_title.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(SplashController());
    final size = MediaQuery.of(context).size;

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
              Color(0xFF1E1040),
            ],
            stops: [0.0, 0.35, 0.65, 1.0],
          ),
        ),
        child: Stack(
          children: [
            // Radial glow background
            AnimatedBuilder(
              animation: c.glowController,
              builder: (context, _) => Positioned(
                top: size.height * 0.18,
                left: size.width / 2 - 140,
                child: Opacity(
                  opacity: c.glowOpacity.value * 0.5,
                  child: Container(
                    width: 280,
                    height: 280,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(
                        colors: [
                          const Color(0xFF6B4FE8).withOpacity(0.4),
                          const Color(0xFF3B2A8A).withOpacity(0.15),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned.fill(child: CustomPaint(painter: NoisePainter())),

            // Content
            SafeArea(
              child: Column(
                children: [
                  Expanded(flex: 5, child: Center(child: SplashLogo(c: c))),
                  Expanded(flex: 4, child: SplashTitle(c: c)),
                  Expanded(flex: 3, child: SplashBottom(c: c)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}