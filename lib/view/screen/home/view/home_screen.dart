import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../widgets/challenge_card.dart';
import '../widgets/home_header.dart';
import '../widgets/quick_habits_section.dart';
import '../widgets/stats_row.dart';

class HomeDashboardScreen extends StatelessWidget {
  const HomeDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F5FA),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 240.h,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFF4A90E2), Color(0xFF63B3ED)],
                ),
              ),
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header (white text on blue bg)
                HomeHeader(
                  greeting: 'Good Morning,',
                  userName: 'Alex Rivera',
                  backgroundColor: Colors.transparent,
                  greetingColor: Colors.white.withOpacity(0.85),
                  nameColor: Colors.white,
                  notificationIconColor: Colors.white,
                  notificationBgColor: Colors.white.withOpacity(0.2),
                  avatarWidget: CircleAvatar(
                    radius: 24.r,
                    backgroundColor: Colors.white.withOpacity(0.25),
                    child: Icon(Icons.person_outline,
                        color: Colors.white, size: 24.sp),
                  ),
                ),

                SizedBox(height: 12.h),

                // Challenge Card floats over the gradient
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: ActiveChallengeCard(
                    onCompleteTap: () => Get.back(),
                  ),
                ),

                SizedBox(height: 32.h),

                // Stats Row
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: const StatsRow(streakCount: 12, pointsCount: 850),
                ),

                SizedBox(height: 32.h),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: QuickHabitsSection(
                    onViewAll: () {},
                    items: const [
                      QuickHabitItem(
                        icon: Icons.menu_book_rounded,
                        iconBgColor: Color(0xFFF3E8FF),
                        iconColor: Color(0xFF9B59B6),
                        title: 'Read 10 Pages',
                        subtitle: 'Not started yet',
                      ),
                      QuickHabitItem(
                        icon: Icons.water_drop_outlined,
                        iconBgColor: Color(0xFFE3F8F5),
                        iconColor: Color(0xFF00BCD4),
                        title: 'Hydration Goal',
                        subtitle: '1.5L / 2L today',
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 100.h),
              ],
            ),
          ],
        ),
      ),
    );
  }
}