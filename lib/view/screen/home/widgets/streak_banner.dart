// lib/view/screen/home/widgets/streak_banner.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../components/custom_text/custom_text.dart';

class StreakBanner extends StatelessWidget {
  const StreakBanner({
    super.key,
    this.streakDays = 14,
    this.personalBest = 21,
    this.showBadgeCount = true,
    this.badgeCount = 7,
  });

  final int streakDays;
  final int personalBest;
  final bool showBadgeCount;
  final int badgeCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.w),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: const Color(0xFFE6F9F8),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        children: [
          Container(
            width: 36.w,
            height: 36.h,
            decoration: const BoxDecoration(
              color: Color(0xFF00BCD4),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.flash_on_rounded,
                color: Colors.white, size: 20.sp),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: '$streakDays Day Streak',
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Colors.black87,
                  textAlign: TextAlign.left,
                ),
                CustomText(
                  text: 'Personal best is $personalBest days',
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
          if (showBadgeCount)
            Row(
              children: [
                _dot(true),
                SizedBox(width: 4.w),
                _dot(false),
                SizedBox(width: 6.w),
                Container(
                  padding:
                  EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: const Color(0xFF00BCD4),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: CustomText(
                    text: '$badgeCount',
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }

  Widget _dot(bool filled) {
    return Container(
      width: 10.w,
      height: 10.h,
      decoration: BoxDecoration(
        color: filled ? const Color(0xFF00BCD4) : const Color(0xFFB2EBF2),
        shape: BoxShape.circle,
      ),
    );
  }
}