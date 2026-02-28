import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/app_routes/app_routes.dart';
import '../../../components/custom_royel_appbar/custom_royel_appbar.dart';
import '../../../components/custom_text/custom_text.dart';
import '../widgets/profile_components.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProfileComponents.bgColor,
      appBar: CustomRoyelAppbar(
        titleName: 'Premium Profile',
        leftIcon: true,
        isDark: true,
        showShareIcon: false,
        showAddButton: false,
        rightOnTap: () {},
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            SizedBox(height: 8.h),

            // Avatar
            ProfileComponents.avatarSection(),

            SizedBox(height: 16.h),

            // User Info
            CustomText(text: 'Alex Rivers', fontSize: 24, fontWeight: FontWeight.w800, color: Colors.white),
            SizedBox(height: 4.h),
            CustomText(text: 'Habit Master • Pro Member', fontSize: 13, color: Colors.white.withOpacity(0.45)),

            SizedBox(height: 24.h),

            // Rewards
            ProfileComponents.rewardsCard(),

            SizedBox(height: 28.h),

            // Badges
            ProfileComponents.milestoneBadges(),

            SizedBox(height: 24.h),

            // Menu Items
            ProfileComponents.menuItem(
              icon: Icons.person_outline_rounded,
              label: 'Personal Information',
              onTap: () {},
            ),
            SizedBox(height: 10.h),
            ProfileComponents.menuItem(
              icon: Icons.notifications_none_rounded,
              label: 'Notification Settings',
              onTap: () {},
            ),
            SizedBox(height: 10.h),
            ProfileComponents.menuItem(
              icon: Icons.shield_outlined,
              label: 'Privacy & Security',
              onTap: () {},
            ),

            SizedBox(height: 28.h),

            // Logout Button
            ProfileComponents.logoutButton(
              onTap: () => Get.offAllNamed(AppRoutes.login),
            ),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }

}