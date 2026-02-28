import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../components/custom_royel_appbar/custom_royel_appbar.dart';
import '../../../components/custom_text/custom_text.dart';

class StatsScreen extends StatelessWidget {
  const StatsScreen({super.key});

  static const _weekData = [
    _BarData('MON', 0.55, false),
    _BarData('TUE', 0.65, false),
    _BarData('WED', 1.0, true),
    _BarData('THU', 0.70, false),
    _BarData('FRI', 0.60, false),
    _BarData('SAT', 0.75, false),
    _BarData('SUN', 0.50, false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D1B2E),
      appBar: CustomRoyelAppbar(
        titleName: 'Premium Analytics',
        leftIcon: true,
        rightIcon: null,

      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 12.h),

            Center(
              child: SizedBox(
                width: 200.w,
                height: 200.w,
                child: CustomPaint(
                  painter: _RingPainter(progress: 0.78),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomText(
                          text: '78%',
                          fontSize: 42,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                          textAlign: TextAlign.center,
                        ),
                        CustomText(
                          text: 'Daily Goal',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white.withOpacity(0.55),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 20.h),

            Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: const Color(0xFF1A2E45),
                  borderRadius: BorderRadius.circular(30.r),
                  border: Border.all(
                      color: const Color(0xFF2A4060).withOpacity(0.8)),
                ),
                child: CustomText(
                  text: 'Almost there! Keep going 🔥',
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Colors.white.withOpacity(0.85),
                  textAlign: TextAlign.center,
                ),
              ),
            ),

            SizedBox(height: 28.h),

            Row(
              children: [
                Expanded(
                  child: _StatCard(
                    icon: Icons.check_circle_outline_rounded,
                    iconColor: const Color(0xFF4A9EFF),
                    label: 'TOTAL\nCOMPLETED',
                    value: '1,284',
                    trend: '+12%',
                  ),
                ),
                SizedBox(width: 14.w),
                Expanded(
                  child: _StatCard(
                    icon: Icons.flash_on_rounded,
                    iconColor: const Color(0xFF4A9EFF),
                    label: 'SUCCESS RATE',
                    value: '92%',
                    trend: '+3.4%',
                  ),
                ),
              ],
            ),

            SizedBox(height: 32.h),


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: 'Weekly Progress',
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  textAlign: TextAlign.left,
                ),
                Row(
                  children: [
                    CustomText(
                      text: 'This Week',
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Colors.white.withOpacity(0.45),
                      textAlign: TextAlign.right,
                    ),
                    Icon(Icons.keyboard_arrow_down_rounded,
                        color: Colors.white.withOpacity(0.45), size: 18.sp),
                  ],
                ),
              ],
            ),

            SizedBox(height: 20.h),


            SizedBox(
              height: 180.h,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: _weekData.map((d) => _BarColumn(data: d)).toList(),
              ),
            ),

            SizedBox(height: 32.h),
          ],
        ),
      ),
    );
  }
}


class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.icon,
    required this.iconColor,
    required this.label,
    required this.value,
    required this.trend,
  });

  final IconData icon;
  final Color iconColor;
  final String label;
  final String value;
  final String trend;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(18.w),
      decoration: BoxDecoration(
        color: const Color(0xFF152236),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: const Color(0xFF1E3350)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: iconColor, size: 16.sp),
              SizedBox(width: 6.w),
              Expanded(
                child: CustomText(
                  text: label,
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: Colors.white.withOpacity(0.45),
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          CustomText(
            text: value,
            fontSize: 28,
            fontWeight: FontWeight.w800,
            color: Colors.white,
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 6.h),
          Row(
            children: [
              Icon(Icons.trending_up_rounded,
                  color: const Color(0xFF2ECC71), size: 14.sp),
              SizedBox(width: 4.w),
              CustomText(
                text: trend,
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF2ECC71),
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ],
      ),
    );
  }
}


class _BarColumn extends StatelessWidget {
  const _BarColumn({required this.data});
  final _BarData data;

  @override
  Widget build(BuildContext context) {
    final maxH = 140.h;

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 32.w,
          height: maxH * data.value,
          decoration: BoxDecoration(
            gradient: data.isActive
                ? const LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [Color(0xFF1A6FFF), Color(0xFF4A9EFF)],
            )
                : LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                const Color(0xFF1E3A5F),
                const Color(0xFF1E3A5F).withOpacity(0.6),
              ],
            ),
            borderRadius: BorderRadius.vertical(top: Radius.circular(8.r)),
          ),
        ),
        SizedBox(height: 8.h),
        CustomText(
          text: data.label,
          fontSize: 11,
          fontWeight:
          data.isActive ? FontWeight.w700 : FontWeight.w400,
          color: data.isActive
              ? const Color(0xFF4A9EFF)
              : Colors.white.withOpacity(0.35),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}


class _RingPainter extends CustomPainter {
  final double progress;
  const _RingPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    const strokeW = 14.0;
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeW) / 2;

    // Background ring
    canvas.drawCircle(
      center,
      radius,
      Paint()
        ..color = const Color(0xFF1A3050)
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeW,
    );

    // Glow effect
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2,
      2 * math.pi * progress,
      false,
      Paint()
        ..color = const Color(0xFF4A9EFF).withOpacity(0.3)
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeW + 8
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8),
    );

    // Progress arc
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2,
      2 * math.pi * progress,
      false,
      Paint()
        ..color = const Color(0xFF4A9EFF)
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeW
        ..strokeCap = StrokeCap.round,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}


class _BarData {
  final String label;
  final double value;
  final bool isActive;
  const _BarData(this.label, this.value, this.isActive);
}