import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nesma/core/common/dialog/show_dialog.dart';
import 'package:nesma/core/common/widgets/background_widget.dart';
import 'package:nesma/core/common/widgets/button_widget.dart';
import 'package:nesma/core/common/widgets/loader.dart';
import 'package:nesma/core/extension/context_extension.dart';
import 'package:nesma/core/extension/string_extension.dart';
import 'package:nesma/core/managers/colors/color_manager.dart';
import 'package:nesma/core/managers/routes/routes.dart';
import 'package:nesma/core/managers/theme_manager/text_theme.dart';
import 'package:nesma/core/service_locator.dart';
import 'package:nesma/features/account/presentation/manager/auth_bloc.dart';
import 'package:nesma/features/account/presentation/pages/account_verification_page.dart';
import 'package:nesma/features/account/presentation/widgets/sign_up_widgets/sign_up_text.dart';
import 'package:nesma/features/account/presentation/widgets/sign_up_widgets/sign_up_text_field.dart';
import 'package:nesma/features/account/presentation/widgets/sign_up_widgets/sign_up_upper_widget.dart';
import 'package:sizer/sizer.dart';

class SignUpPageArgument {
  final bool isSignUp;

  SignUpPageArgument({required this.isSignUp});
}

class SignUpPage extends StatelessWidget {
  SignUpPage({
    Key? key,
    required this.argument,
  }) : super(key: key);
  final SignUpPageArgument argument;
  final TextEditingController controller = TextEditingController();
  String countryCode = '966';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (context) => getIt<AuthBloc>(),
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.error != null) {
            showAppDialog(context,
                message: state.error!.message,
                title: state.error!.title,
                buttonAction: () => Navigator.of(context).pop(),
                lottieAnimationWidget: state.error!.errorWidget);
          } else if (state.success != null) {
            context.pushReplacementNamed(
              Routes.accountVerificationPage,
              arguments: AccountVerificationPageArgument(
                isSignUp: !state.success!,
                phoneNumber:countryCode + controller.text,
              ),
            );
          }
        },
        child: Scaffold(
          body: BackgroundWidget(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AccountSignUpPageUpperSection(
                          signUpPage: argument.isSignUp),
                      SizedBox(height: 4.h),
                      PhoneInputTextField(
                        controller: controller,
                        onChanged: (countryCode) {
                          this.countryCode =
                              (countryCode.dialCode ?? '').replaceAll('+', '');
                        },
                      ),
                      SizedBox(height: 10.h),
                      Container(
                        alignment: Alignment.center,
                        child: BlocBuilder<AuthBloc, AuthState>(
                          builder: (context, state) {
                            if (state.checkPhoneLoading == true) {
                              return const Loader();
                            }
                            return ButtonWidget(
                              text: 'continue'.tr,
                              onPressed: () {
                                BlocProvider.of<AuthBloc>(context).add(
                                  AuthEvent.checkPhone(
                                    countryCode + controller.text,
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
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 20.h),
                      const SignUpText()
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
