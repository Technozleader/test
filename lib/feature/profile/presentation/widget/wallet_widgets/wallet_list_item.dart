import 'package:flutter/material.dart';
import 'package:nesma/core/common/widgets/glass_effect_widget.dart';
import 'package:nesma/core/extension/string_extension.dart';
import 'package:nesma/core/managers/colors/color_manager.dart';
import 'package:nesma/core/managers/size_manager/corner_size.dart';
import 'package:nesma/core/managers/size_manager/font_size_manager.dart';
import 'package:nesma/core/managers/theme_manager/text_theme.dart';

class WalletListItem extends StatelessWidget {
  const WalletListItem({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: GlassEffect(
        borderRadius: CornerSize.s13,
        withElevation: true,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.width * 0.01,
                  0,
                  MediaQuery.of(context).size.width * 0.01,
                  0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
                    Text(
                      "purchase".tr,
                      style: TextManager.cardLightFont,
                    ),
                    const Text(
                      "20/1/2023",
                      style: TextManager.cardLightFont,
                    )
                  ],
                ),
              ),
              Divider(
                thickness: 1,
                indent: MediaQuery.of(context).size.width * 0.05,
                endIndent: MediaQuery.of(context).size.width * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        backgroundColor: ColorManager.active,
                        backgroundImage: NetworkImage(
                          'https://th.bing.com/th/id/R.a90e8b82f2d6e58d35181a670a3cbe7a?rik=qLGqJgLBxkW17g&pid=ImgRaw&r=0',
                        ),
                      ),
                      const SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Jarir",
                            style: TextManager.cardLightFont.copyWith(
                              fontSize: FontSizeManager.s13,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          const Text(
                            "SYR 150.0",
                            style: TextManager.cardDarkFont,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Text(
                    "SYR -150.0",
                    style: TextManager.cardDarkFont.copyWith(color: Colors.red),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
