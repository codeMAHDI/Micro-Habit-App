import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../components/custom_text/custom_text.dart';

class QuickHabitItem {
  final IconData icon;
  final Color iconBgColor;
  final Color iconColor;
  final String title;
  final String subtitle;
  final bool isCompleted;

  const QuickHabitItem({
    required this.icon,
    required this.iconBgColor,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    this.isCompleted = false,
  });
}

class QuickHabitsSection extends StatelessWidget {
  const QuickHabitsSection({
    super.key,
    required this.items,
    this.onViewAll,
  });

  final List<QuickHabitItem> items;
  final VoidCallback? onViewAll;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              text: 'Quick Habits',
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Colors.black87,
              textAlign: TextAlign.left,
            ),
            GestureDetector(
              onTap: onViewAll,
              child: const CustomText(
                text: 'View All',
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xFF5B8DEF),
                textAlign: TextAlign.right,
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        ...items.map((item) => _HabitTile(item: item)),
      ],
    );
  }
}

class _HabitTile extends StatelessWidget {
  const _HabitTile({required this.item});
  final QuickHabitItem item;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 44.w,
            height: 44.h,
            decoration: BoxDecoration(
              color: item.iconBgColor,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(item.icon, color: item.iconColor, size: 22.sp),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: item.title,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 2.h),
                CustomText(
                  text: item.subtitle,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
          Container(
            width: 24.w,
            height: 24.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: item.isCompleted
                    ? const Color(0xFF5B8DEF)
                    : Colors.grey.withOpacity(0.3),
                width: 1.5,
              ),
              color: item.isCompleted
                  ? const Color(0xFF5B8DEF)
                  : Colors.transparent,
            ),
            child: item.isCompleted
                ? Icon(Icons.check, color: Colors.white, size: 14.sp)
                : null,
          ),
        ],
      ),
    );
  }
}