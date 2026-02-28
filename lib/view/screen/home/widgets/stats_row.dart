import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../components/custom_text/custom_text.dart';

class StatsRow extends StatelessWidget {
  const StatsRow({
    super.key,
    this.streakCount = 12,
    this.pointsCount = 850,
  });

  final int streakCount;
  final int pointsCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _StatCard(
            icon: Icons.local_fire_department_rounded,
            iconColor: const Color(0xFFFF7043),
            iconBg: const Color(0xFFFFF3F0),
            value: '$streakCount',
            label: 'DAY STREAK',
          ),
        ),
        SizedBox(width: 16.w),
        Expanded(
          child: _StatCard(
            icon: Icons.emoji_events_outlined,
            iconColor: const Color(0xFF5B8DEF),
            iconBg: const Color(0xFFEEF3FD),
            value: '$pointsCount',
            label: 'POINTS',
          ),
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.icon,
    required this.iconColor,
    required this.iconBg,
    required this.value,
    required this.label,
  });

  final IconData icon;
  final Color iconColor;
  final Color iconBg;
  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 52.w,
          height: 52.h,
          decoration: BoxDecoration(
            color: iconBg,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: iconColor, size: 26.sp),
        ),
        SizedBox(height: 8.h),
        CustomText(
          text: value,
          fontSize: 26,
          fontWeight: FontWeight.w800,
          color: Colors.black87,
          textAlign: TextAlign.center,
        ),
        CustomText(
          text: label,
          fontSize: 11,
          fontWeight: FontWeight.w500,
          color: Colors.grey,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}