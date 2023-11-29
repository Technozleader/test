import 'package:flutter/material.dart';
import 'package:nesma/core/extension/context_extension.dart';
import 'package:nesma/core/extension/string_extension.dart';
import 'package:nesma/core/managers/colors/color_manager.dart';
import 'package:nesma/core/managers/routes/routes.dart';
import 'package:nesma/core/managers/size_manager/font_size_manager.dart';
import 'package:nesma/core/managers/theme_manager/text_theme.dart';
import 'package:nesma/features/change_passcode/presentation/pages/change_password_page.dart';

class PassCodeFooter extends StatelessWidget {
  const PassCodeFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: (){
            context.pushNamed(
              Routes.changePasswordCodePage,
              arguments: ChangePasswordCodePageArgument(
                type: ChangePasswordScreenType.verify,
                fieldNumber: 4,
              ),
            );
          },
          child: Text(
            "forgot_passcode".tr,
            style: TextManager.cardLightFont.copyWith(
              fontSize: FontSizeManager.s12,
              color: ColorManager.black,
            ),
          ),
        ),
        Text(
          "switch_account".tr,
          style: TextManager.cardLightFont.copyWith(
            fontSize: FontSizeManager.s12,
            color: ColorManager.black,
          ),
        )
      ],
    );
  }
}
