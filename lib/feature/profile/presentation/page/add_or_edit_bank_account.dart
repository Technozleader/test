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

class AddOrEditBankAccountPageArgument {
  final bool edit;

  AddOrEditBankAccountPageArgument({required this.edit});
}

class AddOrEditBankAccountPage extends StatelessWidget {
  const AddOrEditBankAccountPage({
    Key? key,
    required this.argument,
  }) : super(key: key);
  final AddOrEditBankAccountPageArgument argument;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar:  NesmaAppbar(pageName: "bank_account".tr),
      body: BackgroundWidget(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: context.width * 0.1,
              ),
              NesmaTextField(
                hintText: "account_holder".tr,
                width: context.width * 0.8,
              ),
              NesmaTextField(
                hintText: "bank_name".tr,
                width: context.width * 0.8,
              ),
              NesmaTextField(
                hintText: "SA03 8000 0000 6080 1016 7519",
                width: context.width * 0.8,
              ),
              NesmaTextField(
                hintText: "email".tr,
                width: context.width * 0.8,
              ),
              SizedBox(
                height: context.width * 0.1,
              ),
              ButtonWidget(
                text: 'save_bank_information'.tr,
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
                  text: 'remove_bank_information'.tr,
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
