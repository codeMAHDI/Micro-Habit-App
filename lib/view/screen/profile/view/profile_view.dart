import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/app_routes/app_routes.dart';
import '../../../components/custom_button/custom_button.dart';
import '../../../components/custom_royel_appbar/custom_royel_appbar.dart';
import '../../../components/custom_text/custom_text.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static const _bg = Color(0xFF0D1B2E);
  static const _cardBg = Color(0xFF152236);
  static const _border = Color(0xFF1E3350);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bg,
      appBar: CustomRoyelAppbar(
        titleName: 'Premium Profile',
        leftIcon: true,
        isDark: true,
        showShareIcon: false,
        rightIcon: null,
        showAddButton: false,
        rightOnTap: () {},
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            SizedBox(height: 8.h),

            _AvatarSection(),

            SizedBox(height: 16.h),

            CustomText(
              text: 'Alex Rivers',
              fontSize: 24,
              fontWeight: FontWeight.w800,
              color: Colors.white,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 4.h),
            CustomText(
              text: 'Habit Master • Pro Member',
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: Colors.white.withOpacity(0.45),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 24.h),

            _RewardsCard(),

            SizedBox(height: 28.h),

            _MilestoneBadges(),

            SizedBox(height: 24.h),

            _MenuItem(
              icon: Icons.person_outline_rounded,
              label: 'Personal Information',
              onTap: () {},
            ),
            SizedBox(height: 10.h),
            _MenuItem(
              icon: Icons.notifications_none_rounded,
              label: 'Notification Settings',
              onTap: () {},
            ),
            SizedBox(height: 10.h),
            _MenuItem(
              icon: Icons.shield_outlined,
              label: 'Privacy & Security',
              onTap: () {},
            ),

            SizedBox(height: 28.h),

            GestureDetector(
              onTap: () => Get.offAllNamed(AppRoutes.login),
              child: Container(
                width: double.infinity,
                height: 54.h,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(30.r),
                  border: Border.all(
                      color: const Color(0xFFE74C3C).withOpacity(0.5),
                      width: 1.5),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.logout_rounded,
                        color: const Color(0xFFE74C3C), size: 20.sp),
                    SizedBox(width: 8.w),
                    CustomText(
                      text: 'Logout',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFFE74C3C),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }
}

class _AvatarSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Glow ring
          Container(
            width: 106.w,
            height: 106.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                colors: [Color(0xFF7B5EA7), Color(0xFF4A9EFF)],
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF4A9EFF).withOpacity(0.4),
                  blurRadius: 24,
                  spreadRadius: 2,
                ),
              ],
            ),
          ),
          // Avatar
          Positioned(
            top: 3,
            left: 3,
            child: CircleAvatar(
              radius: 50.r,
              backgroundColor: const Color(0xFF1E3350),
              child: Icon(Icons.person_rounded,
                  color: Colors.white.withOpacity(0.8), size: 52.sp),
            ),
          ),
          // Verified badge
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: 26.w,
              height: 26.h,
              decoration: BoxDecoration(
                color: const Color(0xFF4A9EFF),
                shape: BoxShape.circle,
                border: Border.all(
                    color: ProfileScreen._bg, width: 2),
              ),
              child: Icon(Icons.verified_rounded,
                  color: Colors.white, size: 14.sp),
            ),
          ),
        ],
      ),
    );
  }
}

class _RewardsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: ProfileScreen._cardBg,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: ProfileScreen._border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: 'TOTAL REWARDS',
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF4A9EFF),
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 8.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomText(
                text: '2,450',
                fontSize: 36,
                fontWeight: FontWeight.w800,
                color: Colors.white,
                textAlign: TextAlign.left,
              ),
              SizedBox(width: 6.w),
              Padding(
                padding: EdgeInsets.only(bottom: 6.h),
                child: CustomText(
                  text: 'Points',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.white.withOpacity(0.45),
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          CustomButton(
            title: 'Redeem Rewards',
            height: 46,
            borderRadius: 30,
            gradient: const LinearGradient(
              colors: [Color(0xFF3A7EFF), Color(0xFF5A9EFF)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class _MilestoneBadges extends StatelessWidget {
  static const _badges = [
    _BadgeData('🔥', Color(0xFF8B5E00), Color(0xFFD4A017), '30 Day Streak'),
    _BadgeData('🌿', Color(0xFF0A5C2E), Color(0xFF2ECC71), 'Early Riser'),
    _BadgeData('🏋️', Color(0xFF0D3A6E), Color(0xFF4A9EFF), 'Gym Rat'),
    _BadgeData('🔒', Color(0xFF1A2A3A), Color(0xFF4A6080), 'Focused'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              text: 'Milestone Badges',
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Colors.white,
              textAlign: TextAlign.left,
            ),
            GestureDetector(
              onTap: () {},
              child: const CustomText(
                text: 'View All',
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xFF4A9EFF),
                textAlign: TextAlign.right,
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: _badges
              .map((b) => _BadgeTile(data: b))
              .toList(),
        ),
      ],
    );
  }
}

class _BadgeTile extends StatelessWidget {
  const _BadgeTile({required this.data});
  final _BadgeData data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 60.w,
          height: 60.w,
          decoration: BoxDecoration(
            color: data.bgColor,
            shape: BoxShape.circle,
            border: Border.all(color: data.ringColor.withOpacity(0.5), width: 2),
            boxShadow: [
              BoxShadow(
                color: data.ringColor.withOpacity(0.25),
                blurRadius: 10,
              ),
            ],
          ),
          child: Center(
            child: Text(data.emoji,
                style: TextStyle(fontSize: 24.sp)),
          ),
        ),
        SizedBox(height: 6.h),
        SizedBox(
          width: 70.w,
          child: CustomText(
            text: data.label,
            fontSize: 11,
            fontWeight: FontWeight.w400,
            color: Colors.white.withOpacity(0.5),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

class _BadgeData {
  final String emoji;
  final Color bgColor;
  final Color ringColor;
  final String label;
  const _BadgeData(this.emoji, this.bgColor, this.ringColor, this.label);
}


class _MenuItem extends StatelessWidget {
  const _MenuItem({required this.icon, required this.label, required this.onTap});
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: ProfileScreen._cardBg,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: ProfileScreen._border),
        ),
        child: Row(
          children: [
            Container(
              width: 36.w,
              height: 36.h,
              decoration: BoxDecoration(
                color: const Color(0xFF4A9EFF).withOpacity(0.12),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Icon(icon,
                  color: const Color(0xFF4A9EFF), size: 18.sp),
            ),
            SizedBox(width: 14.w),
            Expanded(
              child: CustomText(
                text: label,
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.white,
                textAlign: TextAlign.left,
              ),
            ),
            Icon(Icons.arrow_forward_ios_rounded,
                color: Colors.white.withOpacity(0.25), size: 14.sp),
          ],
        ),
      ),
    );
  }
}