import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../components/custom_text/custom_text.dart';

class ImagePickerContainer extends StatelessWidget {
  final VoidCallback onTap;
  const ImagePickerContainer({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 110.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: const Color(0xFF4A6FE8).withOpacity(0.4),
            width: 1.5,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 44.w,
              height: 44.h,
              decoration: BoxDecoration(
                color: const Color(0xFFEEF1FD),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Icon(Icons.add_a_photo_outlined,
                  color: const Color(0xFF4A6FE8), size: 22.sp),
            ),
            SizedBox(height: 8.h),
            CustomText(
              text: 'Add Cover Image',
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black54,
            ),
          ],
        ),
      ),
    );
  }
}