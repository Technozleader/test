import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nesma/core/managers/size_manager/font_size_manager.dart';
import 'package:nesma/core/managers/string_manager/assets_manager.dart';
import 'package:nesma/core/managers/theme_manager/text_theme.dart';
import 'package:sizer/sizer.dart';

class NoCardYet extends StatelessWidget {
  const NoCardYet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          SvgPicture.asset(
            AssetsManager.creditCards,
            width: 15.w,
          ),
          SizedBox(height: 3.h),
          Text(
            "You didn’t save any of your cards yet.",
            style: TextManager.cardDarkFont.copyWith(
              fontSize: FontSizeManager.s16,
            ),
          ),
          SizedBox(height: 5.h),
          Text(
            "You can manage your saved cards from here \nonce you add any",
            style: TextManager.cardLightFont.copyWith(
              fontSize: FontSizeManager.s14,
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
