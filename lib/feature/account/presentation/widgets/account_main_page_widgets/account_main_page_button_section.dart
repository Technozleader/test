import 'package:flutter/material.dart';
import 'package:nesma/core/common/widgets/button_widget.dart';
import 'package:nesma/core/extension/context_extension.dart';
import 'package:nesma/core/extension/string_extension.dart';
import 'package:nesma/core/managers/cash_manager/cash_keys.dart';
import 'package:nesma/core/managers/colors/color_manager.dart';
import 'package:nesma/core/managers/manager.dart';
import 'package:nesma/core/managers/routes/routes.dart';
import 'package:nesma/core/managers/theme_manager/text_theme.dart';
import 'package:nesma/features/account/presentation/pages/sign_up_page.dart';

class AccountMainPageButtonSection extends StatelessWidget {
  const AccountMainPageButtonSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ButtonWidget(
              text: 'sign_in'.tr,
              onPressed: () {
                context.pushReplacementNamed(
                  Routes.signUpPage,
                  arguments: SignUpPageArgument(
                    isSignUp: false,
                  ),
                );
                Managers.cashManager.store(CashKeys.firstTime, false);
              },
              options: ButtonOption(
                padding: const EdgeInsets.all(12),
                color: ColorManager.white,
                width: MediaQuery.of(context).size.width * 0.7,
                textStyle: TextManager.label1.copyWith(
                  color: ColorManager.black,
                ),
              ),
            ),
            const SizedBox(height: 16),
            ButtonWidget(
              text: 'sign_up'.tr,
              onPressed: () {
                context.pushReplacementNamed(
                  Routes.signUpPage,
                  arguments: SignUpPageArgument(
                    isSignUp: true,
                  ),
                );
                Managers.cashManager.store(CashKeys.firstTime, false);
              },
              options: ButtonOption(
                padding: const EdgeInsets.all(12),
                color: ColorManager.black,
                textStyle: TextManager.label1.copyWith(
                  color: ColorManager.white,
                ),
                width: MediaQuery.of(context).size.width * 0.7,
              ),
            ),
            const SizedBox(height: 16),
            InkWell(
              onTap: () {
                context.pushNamed(Routes.home);
                Managers.cashManager.store(CashKeys.firstTime, false);
              },
              child:  Text(
                "try_as_a_guest".tr,
                style: TextManager.label2,
              ),
            )
          ],
        ),
      ),
    );
  }
}
