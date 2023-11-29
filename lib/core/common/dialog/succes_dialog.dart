import 'package:flutter/material.dart';
import 'package:nesma/core/common/widgets/button_widget.dart';
import 'package:nesma/core/common/widgets/glass_effect_widget.dart';
import 'package:nesma/core/extension/context_extension.dart';
import 'package:nesma/core/managers/colors/color_manager.dart';
import 'package:nesma/core/managers/string_manager/assets_manager.dart';
import 'package:nesma/core/managers/theme_manager/text_theme.dart';

class PaymentSuccessDialog extends StatelessWidget {
  const PaymentSuccessDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlassEffect(
      height: context.height * 0.3,
      withElevation: true,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(AssetsManager.check),
            const Text("Payment success"),
            const Text("Your payment has been\nprocessed successfully"),
            ButtonWidget(
              text: 'Done',
              onPressed: () {
                Navigator.pop(context);
              },
              options: ButtonOption(
                padding: const EdgeInsets.all(12),
                color: ColorManager.black,
                width: MediaQuery.of(context).size.width * 0.7,
                textStyle: TextManager.label1.copyWith(
                  color: ColorManager.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
