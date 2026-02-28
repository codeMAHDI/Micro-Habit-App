import 'dart:ui';
import 'package:flutter/material.dart';
class AppColors {
  static const Color primary = Color(0xFF246BFD);
  static const Color black = Color(0xff0E0E0E);
  static const Color blackShade = Color(0xff0F172A);
  static const Color greyShade = Color(0xff475569);
  static const Color gery2 = Color(0xff94A3BB);
  static const Color black_02 = Color(0xff181818);
  static const Color white = Color(0xffFFFFFF);
  static const Color white_50 = Color(0xffF1F1F2);
  static const Color red = Color(0xffFF0000);
  static const Color green = Color(0xff008000);

  static const Color black_80 = Color(0xff181818);
  static const Color black_03 = Color(0xff171717);
  static const Color navbarClr = Color(0xff1D1F24);
  static const Color black_04 = Color(0xff4F4F59);
  static const Color black_05 = Color(0xff434242);

  static const Color lightGreen = Color(0xff5BD7BC);
  static const Color lightWhite = Color(0xffEEF6FF);
  static const Color lightBlue = Color(0xff57b2f4);
  static const Color orange = Color(0xffFF9800);

  //Habit app colors
  static const Color scaffoldBg = Color(0xFF0D1B2A); // Dark Background

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF4158D0), Color(0xFFC850C0)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient orangeGradient = LinearGradient(
    colors: [Color(0xFFFF9A8B), Color(0xFFFF6A88)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient tealGradient = LinearGradient(
    colors: [Color(0xFF00DBDE), Color(0xFFFC00FF)], // Custom teal mix
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static Color glassColor = Colors.white.withOpacity(0.1);
  static Color glassBorder = Colors.white.withOpacity(0.2);
}
