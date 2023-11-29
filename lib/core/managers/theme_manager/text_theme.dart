import 'package:flutter/material.dart';
import 'package:nesma/core/managers/colors/color_manager.dart';
import 'package:nesma/core/managers/size_manager/font_size_manager.dart';

class TextManager {
  static const _kFontFam = 'sequel_sans';

  static const TextStyle label1 = TextStyle(
    color: ColorManager.grey2,
    fontSize: FontSizeManager.s15,
    fontFamily: _kFontFam,
  );
  static const TextStyle label2 = TextStyle(
    color: ColorManager.grey,
    fontSize: FontSizeManager.s13,
    fontFamily: _kFontFam,
  );
  static const TextStyle cardLightFont = TextStyle(
    color: ColorManager.grey,
    fontSize: FontSizeManager.s11,
    fontFamily: _kFontFam,
    fontWeight: FontWeight.w300,
  );
  static const TextStyle cardDarkFont = TextStyle(
    color: ColorManager.black,
    fontSize: FontSizeManager.s16,
    fontWeight: FontWeight.w400,
    fontFamily: _kFontFam,
  );

  static const TextStyle headline1 = TextStyle(
    color: ColorManager.black,
    fontWeight: FontWeight.w500,
    fontSize: FontSizeManager.s23,
    fontFamily: _kFontFam,
  );
  static const TextStyle headline2 = TextStyle(
    color: ColorManager.black,
    fontWeight: FontWeight.w500,
    fontSize: FontSizeManager.s20,
    fontFamily: _kFontFam,
  );

  static const TextStyle accountSubtitle = TextStyle(
    color: ColorManager.grey,
    fontSize: FontSizeManager.s15,
    fontFamily: _kFontFam,
  );

  static const TextStyle accountTitle = TextStyle(
    color: ColorManager.black,
    fontWeight: FontWeight.w500,
    fontSize: FontSizeManager.s23,
    fontFamily: _kFontFam,
  );

  static const TextStyle bodyText1 = TextStyle(
    color: ColorManager.black,
    fontWeight: FontWeight.w500,
    fontSize: FontSizeManager.s17,
    fontFamily: _kFontFam,
  );
  static const TextStyle cardTitle = TextStyle(
    color: ColorManager.black,
    fontWeight: FontWeight.w400,
    fontSize: FontSizeManager.s12,
    fontFamily: _kFontFam,
  );

  static TextTheme get textTheme => const TextTheme(
      subtitle1: label1, headline1: headline1, bodyText1: bodyText1);
}
