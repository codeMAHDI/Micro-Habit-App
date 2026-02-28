import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../components/custom_button/custom_button.dart';
import '../../../components/custom_text/custom_text.dart';

class ProfileComponents {
  static const bgColor = Color(0xFF0D1B2E);
  static const cardBg = Color(0xFF152236);
  static const borderColor = Color(0xFF1E3350);

  // Avatar Section
  static Widget avatarSection() {
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 106.w,
            height: 106.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(colors: [Color(0xFF7B5EA7), Color(0xFF4A9EFF)]),
              boxShadow: [
                BoxShadow(color: const Color(0xFF4A9EFF).withOpacity(0.4), blurRadius: 24, spreadRadius: 2),
              ],
            ),
          ),
          Positioned(
            top: 3,
            left: 3,
            child: CircleAvatar(
              radius: 50.r,
              backgroundColor: borderColor,
              child: Icon(Icons.person_rounded, color: Colors.white.withOpacity(0.8), size: 52.sp),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: 26.w,
              height: 26.h,
              decoration: BoxDecoration(
                color: const Color(0xFF4A9EFF),
                shape: BoxShape.circle,
                border: Border.all(color: bgColor, width: 2),
              ),
              child: Icon(Icons.verified_rounded, color: Colors.white, size: 14.sp),
            ),
          ),
        ],
      ),
    );
  }

  // Rewards Card
  static Widget rewardsCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(text: 'TOTAL REWARDS', fontSize: 11, fontWeight: FontWeight.w600, color: const Color(0xFF4A9EFF)),
          SizedBox(height: 8.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomText(text: '2,450', fontSize: 36, fontWeight: FontWeight.w800, color: Colors.white),
              SizedBox(width: 6.w),
              Padding(
                padding: EdgeInsets.only(bottom: 6.h),
                child: CustomText(text: 'Points', fontSize: 16, color: Colors.white.withOpacity(0.45)),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          CustomButton(
            title: 'Redeem Rewards',
            height: 46,
            borderRadius: 30,
            gradient: const LinearGradient(colors: [Color(0xFF3A7EFF), Color(0xFF5A9EFF)]),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  // Milestone Badges
  static Widget milestoneBadges() {
    final badges = [
      {'emoji': '🔥', 'bg': const Color(0xFF8B5E00), 'ring': const Color(0xFFD4A017), 'label': '30 Day Streak'},
      {'emoji': '🌿', 'bg': const Color(0xFF0A5C2E), 'ring': const Color(0xFF2ECC71), 'label': 'Early Riser'},
      {'emoji': '🏋️', 'bg': const Color(0xFF0D3A6E), 'ring': const Color(0xFF4A9EFF), 'label': 'Gym Rat'},
      {'emoji': '🔒', 'bg': const Color(0xFF1A2A3A), 'ring': const Color(0xFF4A6080), 'label': 'Focused'},
    ];

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(text: 'Milestone Badges', fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white),
            CustomText(text: 'View All', fontSize: 14, color: const Color(0xFF4A9EFF)),
          ],
        ),
        SizedBox(height: 16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: badges.map((b) => Column(
            children: [
              Container(
                width: 60.w,
                height: 60.w,
                decoration: BoxDecoration(
                  color: b['bg'] as Color,
                  shape: BoxShape.circle,
                  border: Border.all(color: (b['ring'] as Color).withOpacity(0.5), width: 2),
                ),
                child: Center(child: Text(b['emoji'] as String, style: TextStyle(fontSize: 24.sp))),
              ),
              SizedBox(height: 6.h),
              SizedBox(
                width: 70.w,
                child: CustomText(text: b['label'] as String, fontSize: 11, color: Colors.white.withOpacity(0.5), textAlign: TextAlign.center),
              ),
            ],
          )).toList(),
        ),
      ],
    );
  }

  // Menu Item
  static Widget menuItem({required IconData icon, required String label, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: cardBg,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: borderColor),
        ),
        child: Row(
          children: [
            Container(
              width: 36.w,
              height: 36.h,
              decoration: BoxDecoration(color: const Color(0xFF4A9EFF).withOpacity(0.12), borderRadius: BorderRadius.circular(10.r)),
              child: Icon(icon, color: const Color(0xFF4A9EFF), size: 18.sp),
            ),
            SizedBox(width: 14.w),
            Expanded(child: CustomText(text: label, fontSize: 15, fontWeight: FontWeight.w500, color: Colors.white)),
            Icon(Icons.arrow_forward_ios_rounded, color: Colors.white.withOpacity(0.25), size: 14.sp),
          ],
        ),
      ),
    );
  }

  static Widget logoutButton({required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 54.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.r),
          border: Border.all(
            color: const Color(0xFFE74C3C).withOpacity(0.5),
            width: 1.5,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.logout_rounded, color: const Color(0xFFE74C3C), size: 20.sp),
            SizedBox(width: 8.w),
            CustomText(
              text: 'Logout',
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: const Color(0xFFE74C3C),
            ),
          ],
        ),
      ),
    );
  }

}