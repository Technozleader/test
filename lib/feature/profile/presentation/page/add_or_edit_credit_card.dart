import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nesma/core/common/dialog/succes_dialog.dart';
import 'package:nesma/core/common/widgets/app_bar/nesma_app_bar.dart';
import 'package:nesma/core/common/widgets/background_widget.dart';
import 'package:nesma/core/common/widgets/button_widget.dart';
import 'package:nesma/core/common/widgets/text_field/nesma_text_field.dart';
import 'package:nesma/core/extension/context_extension.dart';
import 'package:nesma/core/extension/string_extension.dart';
import 'package:nesma/core/managers/colors/color_manager.dart';
import 'package:nesma/core/managers/theme_manager/text_theme.dart';
import 'package:nesma/features/purchases/presentation/widgets/purchases_payment_widgets/purchases_payment_widgets.dart';

class AddOrEditCreditCardPageArgument {
  final bool edit;

  AddOrEditCreditCardPageArgument({required this.edit});
}

class AddOrEditCreditCardPage extends StatelessWidget {
  const AddOrEditCreditCardPage({
    Key? key,
    required this.argument,
  }) : super(key: key);
  final AddOrEditCreditCardPageArgument argument;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: NesmaAppbar(pageName: "credit_cards".tr),
      body: BackgroundWidget(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const VisaContainer(),
              SizedBox(
                height: context.width * 0.1,
              ),
              NesmaTextField(
                hintText: "card_number".tr,
                width: context.width * 0.8,
              ),
              NesmaTextField(
                hintText: "card_holder_name".tr,
                width: context.width * 0.8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NesmaTextField(
                    hintText: "expiry".tr,
                    width: context.width * 0.3,
                  ),
                  NesmaTextField(
                    hintText: "CVV",
                    width: context.width * 0.3,
                  ),
                ],
              ),
              SizedBox(
                height: context.width * 0.1,
              ),
              ButtonWidget(
                text: argument.edit ? "save_changes".tr : 'save_card'.tr,
                onPressed: () {
                  showCupertinoDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const AlertDialog(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        content: PaymentSuccessDialog(),
                      );
                    },
                  );
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
              SizedBox(
                height: context.width * 0.1,
              ),
              if (argument.edit)
                ButtonWidget(
                  text: 'remove_card'.tr,
                  onPressed: () {
                    showCupertinoDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const AlertDialog(
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          content: PaymentSuccessDialog(),
                        );
                      },
                    );
                  },
                  options: ButtonOption(
                    padding: const EdgeInsets.all(12),
                    color: ColorManager.red,
                    width: MediaQuery.of(context).size.width * 0.7,
                    textStyle: TextManager.label1.copyWith(
                      color: ColorManager.white,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
