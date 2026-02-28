import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../components/custom_text/custom_text.dart';

class ProgressCard extends StatelessWidget {
  const ProgressCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.percentage,
    required this.color,
  });

  final String title;
  final String subtitle;
  final double percentage; // 0.0 to 1.0
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          SizedBox(
            width: 80.w,
            height: 80.w,
            child: CustomPaint(
              painter: _RingPainter(
                  percentage: percentage, color: color),
              child: Center(
                child: CustomText(
                  text: '${(percentage * 100).toInt()}%',
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: color,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          SizedBox(height: 12.h),
          CustomText(
            text: title,
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 2.h),
          CustomText(
            text: subtitle,
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Colors.grey,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _RingPainter extends CustomPainter {
  final double percentage;
  final Color color;

  _RingPainter({required this.percentage, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final strokeWidth = 7.0;
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;

    canvas.drawCircle(
      center,
      radius,
      Paint()
        ..color = color.withOpacity(0.12)
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth,
    );

    // Progress arc
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2,
      2 * math.pi * percentage,
      false,
      Paint()
        ..color = color
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..strokeCap = StrokeCap.round,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}