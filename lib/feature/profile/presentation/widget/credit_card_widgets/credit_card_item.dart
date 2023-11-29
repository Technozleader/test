import 'package:flutter/material.dart';
import 'package:nesma/core/common/widgets/glass_effect_widget.dart';
import 'package:nesma/core/extension/string_extension.dart';
import 'package:nesma/core/managers/colors/color_manager.dart';
import 'package:nesma/core/managers/size_manager/corner_size.dart';
import 'package:nesma/core/managers/string_manager/assets_manager.dart';
import 'package:nesma/core/managers/theme_manager/text_theme.dart';

class CreditCardItem extends StatelessWidget {
  const CreditCardItem({
    Key? key,
    required this.onTap,
  }) : super(key: key);
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: GlassEffect(
          borderRadius: CornerSize.s13,
          withElevation: true,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      backgroundColor: ColorManager.active,
                      backgroundImage: AssetImage(AssetsManager.creditCardVisa),
                    ),
                    const SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [
                        const Text(
                          "**** **** **** 1234",
                          style: TextManager.cardDarkFont,
                        ),
                        Text(
                          "${'valid_until'.tr} 12/23",
                          style: TextManager.cardLightFont,
                        ),
                      ],
                    ),
                  ],
                ),
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 15,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
