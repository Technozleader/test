import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nesma/core/common/bloc/app_manager_cubit.dart';
import 'package:nesma/core/extension/string_extension.dart';
import 'package:nesma/core/managers/colors/color_manager.dart';
import 'package:nesma/core/managers/size_manager/font_size_manager.dart';
import 'package:nesma/core/managers/theme_manager/text_theme.dart';

class SignUpText extends StatelessWidget {
  const SignUpText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppManagerCubit, AppManagerState>(
      builder: (context, state) {
        return RichText(
          text: TextSpan(
            text: '${'clicking_continue_indicates_that_you_agree_to_our'.tr} ',
            style: TextManager.cardLightFont.copyWith(
              fontSize: FontSizeManager.s12,
            ),
            children: <TextSpan>[
              TextSpan(
                text: '${'terms_and_conditions'.tr} ',
                style: TextManager.cardLightFont.copyWith(
                  color: ColorManager.active,
                  fontSize: FontSizeManager.s12,
                ),
              ),
              TextSpan(text: 'and_our'.tr),
              TextSpan(
                text: ' ${'privacy_policy'.tr} ',
                style: TextManager.cardLightFont.copyWith(
                  color: ColorManager.active,
                  fontSize: FontSizeManager.s12,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
