import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:micro_habit/core/app_routes/app_routes.dart';
import 'package:micro_habit/view/components/custom_text/custom_text.dart';
import 'package:micro_habit/view/screen/create_challenge/view/create_challenge_view.dart';
import '../controller/navbar_controller.dart';
import 'home_alternative_screen.dart';
import '../../stats/view/stats_view.dart';
import '../../profile/view/profile_view.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  static const _activeColor = Color(0xFF4A90E2);
  static const _inactiveColor = Color(0xFFADB5BD);

  @override
  Widget build(BuildContext context) {
    final NavbarController controller = Get.put(NavbarController());

    final List<Widget> screens = [
      const HomeAlternativeScreen(),
      const CreateChallengeView(),
      const StatsScreen(),
      const ProfileScreen(),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() => screens[controller.selectedIndex.value]),

      floatingActionButton: _CenterFab(
        onTap: () => Get.toNamed(AppRoutes.createChallenge),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: Obx(
            () => _CustomBottomNav(
          selectedIndex: controller.selectedIndex.value,
          onTap: controller.changeIndex,
        ),
      ),
    );
  }
}

class _CustomBottomNav extends StatelessWidget {
  const _CustomBottomNav({
    required this.selectedIndex,
    required this.onTap,
  });

  final int selectedIndex;
  final void Function(int) onTap;

  static const _items = [
    _NavItem(icon: Icons.home_rounded, outlinedIcon: Icons.home_outlined, label: 'Home', index: 0),
    _NavItem(icon: Icons.calendar_month_rounded, outlinedIcon: Icons.calendar_month_outlined, label: 'Habits', index: 1),
    _NavItem(icon: Icons.bar_chart_rounded, outlinedIcon: Icons.bar_chart_outlined, label: 'Stats', index: 2),
    _NavItem(icon: Icons.settings_rounded, outlinedIcon: Icons.settings_outlined, label: 'Profile', index: 3),
  ];

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 10,
      color: Colors.white,
      elevation: 8,
      surfaceTintColor: Colors.white,
      shadowColor: Colors.black.withOpacity(0.06),
      child: SizedBox(
        height: 64.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildItem(_items[0]),
            _buildItem(_items[1]),
            SizedBox(width: 48.w),
            _buildItem(_items[2]),
            _buildItem(_items[3]),
          ],
        ),
      ),
    );
  }

  Widget _buildItem(_NavItem item) {
    final isSelected = selectedIndex == item.index;
    return GestureDetector(
      onTap: () => onTap(item.index),
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: 64.w,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Blue indicator bar on top
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeOut,
              height: 3,
              width: isSelected ? 28.w : 0,
              decoration: BoxDecoration(
                color: MainScreen._activeColor,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            SizedBox(height: 6.h),
            Icon(
              isSelected ? item.icon : item.outlinedIcon,
              color: isSelected
                  ? MainScreen._activeColor
                  : MainScreen._inactiveColor,
              size: 24.sp,
            ),
            SizedBox(height: 3.h),
            CustomText(
              text: item.label,
              fontSize: 11,
              fontWeight:
              isSelected ? FontWeight.w600 : FontWeight.w400,
              color: isSelected
                  ? MainScreen._activeColor
                  : MainScreen._inactiveColor,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _CenterFab extends StatelessWidget {
  const _CenterFab({required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 58.w,
        height: 58.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: MainScreen._activeColor,
          boxShadow: [
            BoxShadow(
              color: MainScreen._activeColor.withOpacity(0.35),
              blurRadius: 16,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Icon(Icons.add, color: Colors.white, size: 28.sp),
      ),
    );
  }
}

class _NavItem {
  final IconData icon;
  final IconData outlinedIcon;
  final String label;
  final int index;

  const _NavItem({
    required this.icon,
    required this.outlinedIcon,
    required this.label,
    required this.index,
  });
}