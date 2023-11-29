import 'dart:ui';

import 'package:flutter/material.dart';

class ColorManager {
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color black2 = Color(0xFF131313);
  static const Color blue = Colors.blue;
  static const Color label = Color(0xFF9D9D9D);
  static const Color grey = Color(0xFF666666);
  static const Color grey2 = Color(0xFF333333);
  static const Color grey3 = Color(0xFFCCCCCC);
  static const Color grey4 = Color(0xFFBDBDBD);
  static const Color active = Color(0xFFFF9675);
  static const Color inactive = Color(0xFFCCCCCC);
  static const Color red = Color(0xFFEE0606);
  static const Color red2 = Color(0xFFD2042D);
  static const Color pink = Color(0xFFE097C4);
  static const Color green = Color(0xFF28A745);
  static const Color purple = Color(0xFF4E3EB3);

  static LinearGradient visaCard = const LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [
      Color(0XFFEFA3B6),
      Color(0XFFC893D8),
    ],
  );
}
