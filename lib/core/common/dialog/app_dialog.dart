import 'package:flutter/material.dart';
import 'package:nesma/core/common/widgets/glass_effect_widget.dart';
import 'package:nesma/core/extension/context_extension.dart';
import 'package:nesma/core/managers/colors/color_manager.dart';
import 'package:nesma/core/managers/theme_manager/text_theme.dart';
import 'package:nesma/core/common/widgets/button_widget.dart';

class AppDialog extends StatelessWidget {
  final Widget? lottieAnimationPath;
  final String? title;
  final String? message;
  final String? buttonText;
  final VoidCallback? buttonAction;

  const AppDialog({
    Key? key,
    this.lottieAnimationPath,
    this.title,
    this.message,
    this.buttonText,
    this.buttonAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlassEffect(
      containWhiteBorder: true,
      width: context.width * 0.9,
      child: Padding(
        padding: const EdgeInsets.all(21),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Offstage(
              offstage: lottieAnimationPath == null,
              child: SizedBox(
                width: 70,
                height: 70,
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: lottieAnimationPath,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                title ?? '',
                textAlign: TextAlign.center,
                style: TextManager.accountTitle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 17),
              child: SizedBox(
                width: context.width * 0.5,
                child: Text(
                  message ?? '',
                  textAlign: TextAlign.center,
                  style: TextManager.cardDarkFont.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: ButtonWidget(
                text: buttonText ?? 'Done',
                onPressed: buttonAction ?? () => context.pop(),
                options: ButtonOption(
                  padding: const EdgeInsets.all(12),
                  color: ColorManager.black,
                  width: context.width * 0.7,
                  textStyle: TextManager.label1.copyWith(
                    color: ColorManager.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
