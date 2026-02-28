import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../components/custom_text/custom_text.dart';

class UpNextItem {
  final IconData icon;
  final Color iconBgColor;
  final Color iconColor;
  final String title;
  final String subtitle;
  final String time;

  const UpNextItem({
    required this.icon,
    required this.iconBgColor,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    required this.time,
  });
}

class UpNextSection extends StatelessWidget {
  const UpNextSection({super.key, required this.items});

  final List<UpNextItem> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: 'Up Next',
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: Colors.black87,
          textAlign: TextAlign.left,
        ),
        SizedBox(height: 12.h),
        ...items.map((item) => _UpNextTile(item: item)),
      ],
    );
  }
}

class _UpNextTile extends StatelessWidget {
  const _UpNextTile({required this.item});
  final UpNextItem item;

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
          CustomText(
            text: item.time,
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Colors.grey,
            textAlign: TextAlign.right,
          ),
        ],
      ),
    );
  }
}