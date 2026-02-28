// lib/view/screen/home/widgets/featured_challenge_card.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../components/custom_text/custom_text.dart';
import '../../../components/custom_button/custom_button.dart';

class FeaturedChallengeCard extends StatelessWidget {
  const FeaturedChallengeCard({
    super.key,
    this.title = 'Deep Focus Session',
    this.duration = '45 mins',
    this.level = 'Advanced',
    this.isPremium = true,
    this.onStartTap,
  });

  final String title;
  final String duration;
  final String level;
  final bool isPremium;
  final VoidCallback? onStartTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image area
          Stack(
            children: [
              ClipRRect(
                borderRadius:
                BorderRadius.vertical(top: Radius.circular(20.r)),
                child: Container(
                  height: 160.h,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFF2D8E8A),
                        Color(0xFF1B5E7A),
                        Color(0xFF0D3D5C),
                      ],
                    ),
                  ),
                  child: CustomPaint(painter: _WavePainter()),
                ),
              ),
              if (isPremium)
                Positioned(
                  top: 12.h,
                  left: 12.w,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: 10.w, vertical: 5.h),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.25),
                      borderRadius: BorderRadius.circular(20.r),
                      border: Border.all(
                          color: Colors.white.withOpacity(0.5), width: 1),
                    ),
                    child: const CustomText(
                      text: 'PREMIUM',
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),

          // Content
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: title,
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: Colors.black87,
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 6.h),
                Row(
                  children: [
                    Icon(Icons.access_time_rounded,
                        size: 14.sp, color: Colors.grey),
                    SizedBox(width: 4.w),
                    CustomText(
                      text: duration,
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(width: 16.w),
                    Icon(Icons.location_on_outlined,
                        size: 14.sp, color: Colors.grey),
                    SizedBox(width: 4.w),
                    CustomText(
                      text: level,
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                CustomButton(
                  title: 'Start Challenge ▶',
                  height: 48,
                  borderRadius: 30,
                  gradient: const LinearGradient(
                    colors: [Color(0xFF00D4CC), Color(0xFF00BCD4)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  onTap: onStartTap ?? () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _WavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.06)
      ..style = PaintingStyle.fill;

    for (int i = 0; i < 4; i++) {
      final path = Path();
      final yOffset = size.height * 0.3 + i * 18.0;
      path.moveTo(0, yOffset);
      for (double x = 0; x <= size.width; x += 1) {
        path.lineTo(
          x,
          yOffset +
              12 *
                  (0.5 *
                      (1 +
                          (x / size.width * 3.14159 * 2 + i * 0.8)
                              .toDouble()) -
                      0.5),
        );
      }
      path.lineTo(size.width, size.height);
      path.lineTo(0, size.height);
      path.close();
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}