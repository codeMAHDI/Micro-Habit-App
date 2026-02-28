import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../components/custom_text/custom_text.dart';
import '../../../components/custom_button/custom_button.dart';

class ActiveChallengeCard extends StatelessWidget {
  const ActiveChallengeCard({
    super.key,
    this.title = 'Mindful Breathing',
    this.sessionInfo = 'Session 4 of 10 • 5 mins',
    this.focusTitle = 'Deep Focus State',
    this.focusSubtitle = 'Maintain steady rhythm',
    this.progressPercent = 0.65,
    this.onCompleteTap,
  });

  final String title;
  final String sessionInfo;
  final String focusTitle;
  final String focusSubtitle;
  final double progressPercent;
  final VoidCallback? onCompleteTap;

  @override
  Widget build(BuildContext context) {
    return Container(

      margin: EdgeInsets.symmetric(horizontal: 24.w),
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding:
                EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                decoration: BoxDecoration(
                  color: const Color(0xFFE8F0FE),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: const CustomText(
                  text: 'ACTIVE CHALLENGE',
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF4A6FE8),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                width: 52.w,
                height: 52.w,
                child: CustomPaint(
                  painter: _RingPainter(
                      percentage: progressPercent,
                      color: const Color(0xFF4A6FE8)),
                  child: Center(
                    child: CustomText(
                      text:
                      '${(progressPercent * 100).toInt()}%',
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF4A6FE8),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 12.h),

          CustomText(
            text: title,
            fontSize: 22,
            fontWeight: FontWeight.w800,
            color: Colors.black87,
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 4.h),
          CustomText(
            text: sessionInfo,
            fontSize: 13,
            fontWeight: FontWeight.w400,
            color: Colors.grey,
            textAlign: TextAlign.left,
          ),

          SizedBox(height: 16.h),

          Container(
            padding:
            EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
            decoration: BoxDecoration(
              color: const Color(0xFFF5F7FA),
              borderRadius: BorderRadius.circular(14.r),
            ),
            child: Row(
              children: [
                Container(
                  width: 36.w,
                  height: 36.h,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE8F0FE),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Icon(Icons.air_rounded,
                      color: const Color(0xFF4A6FE8), size: 18.sp),
                ),
                SizedBox(width: 12.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: focusTitle,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 2.h),
                    CustomText(
                      text: focusSubtitle,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ],
            ),
          ),

          SizedBox(height: 16.h),

          CustomButton(
            title: 'Complete Challenge ✓',
            height: 50,
            borderRadius: 30,
            gradient: const LinearGradient(
              colors: [Color(0xFF3A6FE8), Color(0xFF1A4FD8)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            onTap: onCompleteTap ?? () {},
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
    const strokeWidth = 4.0;
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;

    canvas.drawCircle(
      center,
      radius,
      Paint()
        ..color = color.withOpacity(0.15)
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth,
    );
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