import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../controller/splash_controller.dart';

class SplashLogo extends StatelessWidget {
  final SplashController c;
  const SplashLogo({super.key, required this.c});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([c.logoController, c.glowController]),
      builder: (context, _) {
        return Opacity(
          opacity: c.logoOpacity.value,
          child: Transform.scale(
            scale: c.logoScale.value,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Outer glow ring
                Container(
                  width: 130,
                  height: 130,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF6B4FE8)
                            .withOpacity(c.glowOpacity.value * 0.6),
                        blurRadius: 40,
                        spreadRadius: 10,
                      ),
                      BoxShadow(
                        color: Colors.white.withOpacity(0.08),
                        blurRadius: 20,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                ),
                // White circle
                Container(
                  width: 110,
                  height: 110,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.3),
                        blurRadius: 20,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: const Center(child: _LogoMark()),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _LogoMark extends StatelessWidget {
  const _LogoMark();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      height: 70,
      child: CustomPaint(painter: _LogoPainter()),
    );
  }
}

class _LogoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF3B5BF6)
      ..strokeWidth = 3.0
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final cx = size.width / 2;
    final cy = size.height / 2;

    final rPath = Path()
      ..moveTo(cx - 14, cy + 16)
      ..lineTo(cx - 14, cy - 16)
      ..lineTo(cx - 2, cy - 16)
      ..quadraticBezierTo(cx + 12, cy - 16, cx + 12, cy - 4)
      ..quadraticBezierTo(cx + 12, cy + 6, cx - 2, cy + 6)
      ..lineTo(cx - 14, cy + 6)
      ..moveTo(cx - 2, cy + 6)
      ..lineTo(cx + 14, cy + 16);
    canvas.drawPath(rPath, paint);

    final leftPath = Path()
      ..moveTo(cx - 22, cy - 2)
      ..cubicTo(cx - 28, cy - 14, cx - 18, cy - 22, cx - 10, cy - 18)
      ..cubicTo(cx - 4, cy - 14, cx - 12, cy - 6, cx - 22, cy - 2);
    canvas.drawPath(leftPath, paint..strokeWidth = 2.5);

    final kPath = Path()
      ..moveTo(cx + 18, cy - 16)
      ..lineTo(cx + 30, cy + 4)
      ..moveTo(cx + 18, cy + 4)
      ..lineTo(cx + 30, cy + 16);
    canvas.drawPath(kPath, paint..strokeWidth = 3.0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}


class NoisePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.white.withOpacity(0.015);
    final random = math.Random(42);
    for (int i = 0; i < 600; i++) {
      canvas.drawCircle(
        Offset(random.nextDouble() * size.width, random.nextDouble() * size.height),
        0.8,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}