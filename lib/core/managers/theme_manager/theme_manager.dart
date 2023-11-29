

import 'package:flutter/material.dart';
import 'package:nesma/core/managers/theme_manager/text_theme.dart';

class ThemeManager {

  static ThemeData get themeData =>ThemeData(
      textTheme: TextManager.textTheme
      );
}