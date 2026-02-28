import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/app_routes/app_routes.dart';
import '../widgets/featured_challenge_card.dart';
import '../widgets/home_header.dart';
import '../widgets/progress_card.dart';
import '../widgets/streak_banner.dart';
import '../widgets/up_next_section.dart';

class HomeAlternativeScreen extends StatelessWidget {
  const HomeAlternativeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            HomeHeader(
              greeting: 'WELCOME BACK',
              userName: 'Alex Rivera',
              backgroundColor: const Color(0xFFF5F7FA),
              avatarWidget: CircleAvatar(
                radius: 24.r,
                backgroundColor: const Color(0xFFB0C4D8),
                backgroundImage: const NetworkImage(
                    'https://i.pravatar.cc/150?img=12'),
              ),
            ),

            SizedBox(height: 8.h),

            // Streak Banner
            const StreakBanner(
                streakDays: 14, personalBest: 21, badgeCount: 7),

            SizedBox(height: 20.h),

            // Featured Challenge Card
            FeaturedChallengeCard(
              onStartTap: () => Get.toNamed(AppRoutes.homeDashboard),
            ),

            SizedBox(height: 28.h),

            // Daily Progress
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Daily Progress',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.black87,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          'View stats',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF00BCD4),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 14.h),
                  Row(
                    children: [
                      Expanded(
                        child: ProgressCard(
                          title: 'Hydration',
                          subtitle: '1.5L / 2L',
                          percentage: 0.75,
                          color: const Color(0xFF00BCD4),
                        ),
                      ),
                      SizedBox(width: 14.w),
                      Expanded(
                        child: ProgressCard(
                          title: 'Steps',
                          subtitle: '4,000 / 10k',
                          percentage: 0.40,
                          color: const Color(0xFF00BCD4),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 28.h),

            // Up Next
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: const UpNextSection(
                items: [
                  UpNextItem(
                    icon: Icons.menu_book_rounded,
                    iconBgColor: Color(0xFFE8F0FE),
                    iconColor: Color(0xFF5B8DEF),
                    title: 'Read 10 Pages',
                    subtitle: '"Atomic Habits" - Chapter 4',
                    time: '10:00 AM',
                  ),
                  UpNextItem(
                    icon: Icons.self_improvement_rounded,
                    iconBgColor: Color(0xFFF3E8FF),
                    iconColor: Color(0xFF9B59B6),
                    title: 'Mindfulness',
                    subtitle: 'Quick 5-min breather',
                    time: '12:30 PM',
                  ),
                ],
              ),
            ),

            SizedBox(height: 100.h), // bottom nav space
          ],
        ),
      ),
    );
  }
}