import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// আপনার প্রজেক্টের সঠিক পাথ অনুযায়ী ইম্পোর্টগুলো ঠিক রাখবেন
import '../../../../../../utils/app_colors/app_colors.dart';
import '../../components/custom_button/custom_button.dart';
import '../../components/custom_text/custom_text.dart';

class CustomShowDialog extends StatefulWidget {
  final String? title;
  final String? discription;
  final String? leftTextButton;
  final String? rightTextButton;
  final Function()? leftOnTap;
  final Function()? rightOnTap;
  final bool? showRowButton;
  final bool? showColumnButton;
  final bool? showCloseButton;
  final Color? textColor;

  const CustomShowDialog({
    super.key,
    required this.title,
    this.discription,
    this.leftOnTap,
    this.rightOnTap,
    this.leftTextButton,
    this.rightTextButton,
    this.showRowButton = false,
    this.showColumnButton = false,
    this.textColor = Colors.black,
    this.showCloseButton = false,
  });

  @override
  State<CustomShowDialog> createState() => _CustomShowDialogState();
}

class _CustomShowDialogState extends State<CustomShowDialog> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          if (widget.showCloseButton == true)
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Icon(Icons.close, color: widget.textColor ?? AppColors.black),
              ),
            ),

          const SizedBox(height: 10),

          CustomText(
            text: "${widget.title}",
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: widget.textColor ?? Colors.black,
            maxLines: 2,
          ),

          if (widget.discription != null && widget.discription!.isNotEmpty)
            Padding(
              padding: EdgeInsets.only(top: 8.h),
              child: CustomText(
                text: "${widget.discription}",
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: widget.textColor ?? Colors.black.withOpacity(0.8),
              ),
            ),

          SizedBox(height: 24.h),

          if (widget.showRowButton == true)
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    onTap: widget.leftOnTap ?? () => Navigator.of(context).pop(),
                    title: widget.leftTextButton ?? "Yes",
                    height: 45.h,
                    fillColor: AppColors.white,
                    textColor: AppColors.red,
                    isBorder: true,
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: CustomButton(
                    onTap: widget.rightOnTap ?? () => Navigator.of(context).pop(),
                    title: widget.rightTextButton ?? "No",
                    height: 45.h,
                    fillColor: const Color(0xFF1E64FF),
                    textColor: AppColors.white,
                    isBorder: false,
                  ),
                ),
              ],
            ),

          if (widget.showColumnButton == true)
            Column(
              children: [
                CustomButton(
                  onTap: widget.leftOnTap ?? () => Navigator.of(context).pop(),
                  title: widget.leftTextButton ?? "Yes",
                  height: 45.h,
                ),
                SizedBox(height: 12.h),
                CustomButton(
                  onTap: widget.rightOnTap ?? () => Navigator.of(context).pop(),
                  title: widget.rightTextButton ?? "No",
                  height: 45.h,
                  fillColor: AppColors.white,
                  textColor: AppColors.primary,
                  isBorder: true,
                  borderWidth: 1,
                )
              ],
            ),
        ],
      ),
    );
  }
}