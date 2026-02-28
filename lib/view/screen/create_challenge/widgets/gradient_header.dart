import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../components/custom_text/custom_text.dart';

class GradientHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final String step;

  const GradientHeader({
    super.key,
    required this.title,
    required this.subtitle,
    this.step = 'Step 1 of 2',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF5B6FF5), Color(0xFF7B9CF8)],
        ),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(28)),
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Container(
                      width: 36.w,
                      height: 36.h,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Icon(Icons.arrow_back_ios_new_rounded,
                          color: Colors.white, size: 16.sp),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  CustomText(
                    text: title,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              CustomText(
                text: step,
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: Colors.white.withOpacity(0.75),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 4.h),
              CustomText(
                text: subtitle,
                fontSize: 26,
                fontWeight: FontWeight.w800,
                color: Colors.white,
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ),
      ),
    );
  }
}