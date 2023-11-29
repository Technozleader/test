import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nesma/core/common/widgets/glass_effect_widget.dart';
import 'package:nesma/core/extension/string_extension.dart';
import 'package:nesma/core/managers/size_manager/font_size_manager.dart';
import 'package:nesma/core/managers/string_manager/assets_manager.dart';
import 'package:nesma/core/managers/theme_manager/text_theme.dart';
import 'package:sizer/sizer.dart';

class WalletUpperWidget extends StatelessWidget {
  const WalletUpperWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlassEffect(
      withElevation: true,
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "you_have".tr,
                  style: TextManager.cardLightFont
                      .copyWith(fontSize: FontSizeManager.s13),
                ),
                const SizedBox(height: 10),
                const Text(
                  "SAR 100.00",
                  style: TextManager.cardDarkFont,
                ),
              ],
            ),
            SvgPicture.asset(
              AssetsManager.profileWallet,
              width: 10.w,
            ),
          ],
        ),
      ),
    );
  }
}
