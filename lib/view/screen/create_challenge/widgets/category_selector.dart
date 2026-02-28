import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../components/custom_text/custom_text.dart';

class CategorySelector extends StatelessWidget {
  final List categories;
  final String selectedCategory;
  final Function(String) onSelect;

  const CategorySelector({
    super.key,
    required this.categories,
    required this.selectedCategory,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10.w,
      runSpacing: 10.h,
      children: categories.map((cat) {
        final isSelected = selectedCategory == cat['label'];
        return GestureDetector(
          onTap: () => onSelect(cat['label']),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
            decoration: BoxDecoration(
              gradient: isSelected
                  ? const LinearGradient(colors: [Color(0xFF4A6FE8), Color(0xFF6A8FF8)])
                  : null,
              color: isSelected ? null : Colors.white,
              borderRadius: BorderRadius.circular(30.r),
              boxShadow: [
                BoxShadow(
                  color: isSelected
                      ? const Color(0xFF4A6FE8).withOpacity(0.3)
                      : Colors.black.withOpacity(0.04),
                  blurRadius: isSelected ? 10 : 6,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(cat['icon'], style: TextStyle(fontSize: 14.sp)),
                SizedBox(width: 6.w),
                CustomText(
                  text: cat['label'],
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: isSelected ? Colors.white : Colors.black54,
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}