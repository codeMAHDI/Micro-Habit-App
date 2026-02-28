import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../utils/app_colors/app_colors.dart';

class CustomPinCode extends StatelessWidget {
  const CustomPinCode({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: PinCodeTextField(
        keyboardType: TextInputType.number,
        appContext: context,
        length: 4,
        enableActiveFill: false,
        animationType: AnimationType.fade,
        animationDuration: Duration(milliseconds: 300),
        controller: controller,
        mainAxisAlignment: MainAxisAlignment.center,

        separatorBuilder: (context, index) => SizedBox(width: 8),
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(12),
          fieldHeight: 56,
          fieldWidth: 68,
          borderWidth: 2,
          inactiveColor: Color(0xFFE5E7EB),
          activeColor: AppColors.primary,
          selectedColor: AppColors.primary,
          activeFillColor: Colors.transparent,
          inactiveFillColor: Colors.transparent,
          selectedFillColor: Colors.transparent,
          disabledColor: Color(0xFFE5E7EB),
        ),
        backgroundColor: Colors.transparent,
        textStyle: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: AppColors.black,
        ),
        cursorColor: AppColors.primary,
        cursorHeight: 24,
        cursorWidth: 2,
        autoFocus: false,
        onChanged: (value) {
        },
        onCompleted: (value) {
          print('OTP Completed: $value');
        },
      ),
    );
  }
}