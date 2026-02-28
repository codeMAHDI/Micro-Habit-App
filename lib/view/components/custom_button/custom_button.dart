import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../utils/app_colors/app_colors.dart';
import '../custom_text/custom_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.height = 55,
    this.width = double.maxFinite,
    required this.onTap,
    this.title = '',
    this.marginVertical = 0,
    this.marginHorizontal = 0,
    this.fillColor = AppColors.primary,
    this.gradient,
    this.textColor = AppColors.white,
    this.isBorder = false,
    this.fontSize,
    this.borderWidth,
    this.borderRadius,
    this.imageSrc,
    this.imageSize,
    this.imageSpacing = 8,
    this.boxShadow,
  });

  final double height;
  final double? width;
  final Color? fillColor;
  final Gradient? gradient;
  final Color textColor;
  final VoidCallback onTap;
  final String title;
  final double marginVertical;
  final double marginHorizontal;
  final bool isBorder;
  final double? fontSize;
  final double? borderWidth;
  final double? borderRadius;
  final String? imageSrc;
  final double? imageSize;
  final double imageSpacing;
  final List<BoxShadow>? boxShadow;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5.h),
        margin: EdgeInsets.symmetric(
            vertical: marginVertical, horizontal: marginHorizontal),
        alignment: Alignment.center,
        height: height,
        width: width,
        decoration: BoxDecoration(
          border: isBorder
              ? Border.all(color: textColor, width: borderWidth ?? .5)
              : null,
          borderRadius: BorderRadius.circular(borderRadius ?? 10),
          gradient: gradient,
          color: gradient == null ? fillColor : null,
          boxShadow: boxShadow,
        ),
        child: imageSrc != null
            ? Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            imageSrc!.endsWith('.svg')
                ? SvgPicture.asset(
              imageSrc!,
              width: imageSize ?? 20.sp,
              height: imageSize ?? 20.sp,
              color: textColor,
            )
                : Image.asset(
              imageSrc!,
              width: imageSize ?? 20.sp,
              height: imageSize ?? 20.sp,
              color: textColor,
            ),
            SizedBox(width: imageSpacing),
            CustomText(
              fontSize: fontSize ?? 18.sp,
              fontWeight: FontWeight.w600,
              color: textColor,
              textAlign: TextAlign.center,
              text: title,
            ),
          ],
        )
            : CustomText(
          fontSize: fontSize ?? 18.sp,
          fontWeight: FontWeight.w600,
          color: textColor,
          textAlign: TextAlign.center,
          text: title,
        ),
      ),
    );
  }
}