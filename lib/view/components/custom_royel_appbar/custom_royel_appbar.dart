import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/app_colors/app_colors.dart';
import '../custom_image/custom_image.dart';
import '../custom_text/custom_text.dart';

class CustomRoyelAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String? titleName;
  final String? rightIcon;
  final void Function()? rightOnTap;
  final bool? leftIcon;
  final bool showAddButton;
  final bool isDark;
  final bool showShareIcon;
  const CustomRoyelAppbar({
    super.key,
    this.titleName,
    this.rightIcon,
    this.rightOnTap,
    this.leftIcon = false,
    this.showAddButton = false,
    this.isDark = false,
    this.showShareIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    final titleColor = isDark ? Colors.white : AppColors.primary;
    final iconColor = isDark ? Colors.white : Colors.black87;
    final bgColor =
    isDark ? const Color(0xFF0D1B2E) : Colors.transparent;

    return AppBar(
      toolbarHeight: 60,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: true,
      backgroundColor: bgColor,
      foregroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,

      leading: leftIcon == true
          ? GestureDetector(
        onTap: () => Navigator.of(context).maybePop(),
        child: Container(
          margin: EdgeInsets.only(left: 16.w),
          width: 36.w,
          height: 36.h,
          decoration: BoxDecoration(
            color: isDark
                ? Colors.white.withOpacity(0.1)
                : Colors.grey.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Icon(Icons.arrow_back_ios_new_rounded,
              color: iconColor, size: 16.sp),
        ),
      )
          : null,

      title: CustomText(
        text: titleName ?? '',
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: titleColor,
        textAlign: TextAlign.center,
      ),

      actions: [
        // Share icon
        if (showShareIcon)
          GestureDetector(
            onTap: rightOnTap,
            child: Container(
              margin: EdgeInsets.only(right: 16.w),
              width: 36.w,
              height: 36.h,
              decoration: BoxDecoration(
                color: isDark
                    ? Colors.white.withOpacity(0.1)
                    : Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Icon(Icons.share_rounded,
                  color: iconColor, size: 18.sp),
            ),
          ),

        // Right image icon
        if (rightIcon != null && !showShareIcon)
          IconButton(
            onPressed: rightOnTap,
            icon: CustomImage(
              imageSrc: rightIcon!,
              height: 32,
              width: 32,
              imageColor: isDark ? Colors.white : AppColors.white,
            ),
          ),

        // Add button
        if (showAddButton)
          Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(12),
              ),
              child: IconButton(
                onPressed: rightOnTap,
                icon: const Icon(Icons.add, color: Colors.white, size: 24),
                padding: EdgeInsets.zero,
              ),
            ),
          ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}