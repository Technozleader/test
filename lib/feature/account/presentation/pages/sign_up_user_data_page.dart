import 'package:flutter/material.dart';
import 'package:nesma/core/common/widgets/background_widget.dart';
import 'package:nesma/core/common/widgets/button_widget.dart';
import 'package:nesma/core/extension/context_extension.dart';
import 'package:nesma/core/extension/string_extension.dart';
import 'package:nesma/core/managers/colors/color_manager.dart';
import 'package:nesma/core/managers/routes/routes.dart';
import 'package:nesma/core/managers/theme_manager/text_theme.dart';
import 'package:nesma/features/account/presentation/pages/account_passcode_page.dart';
import 'package:nesma/features/account/presentation/widgets/sign_up_widgets/sign_up_text_field.dart';
import 'package:sizer/sizer.dart';

class SignUpUserDataPage extends StatelessWidget {
  SignUpUserDataPage({Key? key}) : super(key: key);
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AccountSignUpUserDataPageUpperSection(),
                SizedBox(height: 5.h),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: AccountTextField(
                        hintText: "first_name".tr,
                        controller: firstNameController,
                        onlyDigits: false,
                        keyboardType: TextInputType.name,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: AccountTextField(
                        hintText: "last_name".tr,
                        controller: lastNameController,
                        onlyDigits: false,
                        keyboardType: TextInputType.name,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: AccountTextField(
                        hintText: "email".tr,
                        controller: emailController,
                        onlyDigits: false,
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5.h),
                Container(
                  alignment: Alignment.center,
                  child: ButtonWidget(
                    text: 'continue'.tr,
                    onPressed: () {
                      final phoneNumber = (ModalRoute.of(context)
                              ?.settings
                              .arguments as String?) ??
                          '';
                      context.pushReplacementNamed(
                        Routes.accountPassCodePage,
                        arguments: AccountPassCodePageArgument(
                          isSignUp: true,
                          phoneNumber: phoneNumber,
                          firstName: firstNameController.text,
                          lastName: lastNameController.text,
                          email: emailController.text,
                        ),
                      );
                    },
                    options: ButtonOption(
                      padding: const EdgeInsets.all(12),
                      color: ColorManager.white,
                      width: MediaQuery.of(context).size.width * 0.6,
                      textStyle: TextManager.label1.copyWith(
                        color: ColorManager.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AccountSignUpUserDataPageUpperSection extends StatelessWidget {
  const AccountSignUpUserDataPageUpperSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text(
          "sign_up".tr,
          style: TextManager.headline2,
        ),
        SizedBox(height: 4.h),
         Text(
          "please_enter_the_information_below_as_your_ID_Lqama_indicates".tr,
          style: TextManager.accountSubtitle,
        ),
      ],
    );
  }
}
