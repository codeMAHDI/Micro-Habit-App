import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../components/custom_text/custom_text.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
    required this.greeting,
    required this.userName,
    this.backgroundColor = Colors.transparent,
    this.onNotificationTap,
    this.avatarWidget,
    this.greetingColor,
    this.nameColor,
    this.notificationIconColor,
    this.notificationBgColor,
  });

  final String greeting;
  final String userName;
  final Color backgroundColor;
  final VoidCallback? onNotificationTap;
  final Widget? avatarWidget;
  final Color? greetingColor;
  final Color? nameColor;
  final Color? notificationIconColor;
  final Color? notificationBgColor;

  @override
  Widget build(BuildContext context) {
    final resolvedGreetingColor = greetingColor ?? Colors.grey;
    final resolvedNameColor = nameColor ?? Colors.black87;
    final resolvedIconColor = notificationIconColor ?? Colors.grey[600]!;
    final resolvedNotifBg = notificationBgColor ?? Colors.white;

    return Container(
      color: backgroundColor,
      padding: EdgeInsets.fromLTRB(24.w, 56.h, 24.w, 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              avatarWidget ??
                  CircleAvatar(
                    radius: 24.r,
                    backgroundColor: const Color(0xFFD0D8E8),
                    child: const Icon(Icons.person, color: Colors.white),
                  ),
              SizedBox(width: 12.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: greeting,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: resolvedGreetingColor,
                    textAlign: TextAlign.left,
                  ),
                  CustomText(
                    text: userName,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: resolvedNameColor,
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ],
          ),
          GestureDetector(
            onTap: onNotificationTap,
            child: Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                color: resolvedNotifBg,
                shape: BoxShape.circle,
                boxShadow: notificationBgColor == null
                    ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ]
                    : null,
              ),
              child: Icon(
                Icons.notifications_none_rounded,
                size: 20.sp,
                color: resolvedIconColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}