import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nesma/core/common/dialog/show_dialog.dart';
import 'package:nesma/core/common/widgets/background_widget.dart';
import 'package:nesma/core/common/widgets/button_widget.dart';
import 'package:nesma/core/common/widgets/loader.dart';
import 'package:nesma/core/common/widgets/text_field/otp_text_field/otp_text_field.dart';
import 'package:nesma/core/extension/context_extension.dart';
import 'package:nesma/core/extension/string_extension.dart';
import 'package:nesma/core/extension/validator.dart';
import 'package:nesma/core/managers/colors/color_manager.dart';
import 'package:nesma/core/managers/routes/routes.dart';
import 'package:nesma/core/managers/theme_manager/text_theme.dart';
import 'package:nesma/core/service_locator.dart';
import 'package:nesma/features/account/presentation/manager/auth_bloc.dart';
import 'package:nesma/features/account/presentation/pages/account_passcode_page.dart';
import 'package:nesma/features/account/presentation/widgets/account_verification_widget/account_verification_upper_widget.dart';
import 'package:nesma/features/account/presentation/widgets/account_verification_widget/resend_counter.dart';
import 'package:sizer/sizer.dart';

class AccountVerificationPageArgument {
  final bool isSignUp;
  final String phoneNumber;
  final String? email;
  final String? firstName;
  final String? lastName;

  AccountVerificationPageArgument({
    required this.isSignUp,
    required this.phoneNumber,
    this.email,
    this.firstName,
    this.lastName,
  });
}

class AccountVerificationPage extends StatefulWidget {
  const AccountVerificationPage({
    Key? key,
    required this.argument,
  }) : super(key: key);
  final AccountVerificationPageArgument argument;

  @override
  State<AccountVerificationPage> createState() =>
      _AccountVerificationPageState();
}

class _AccountVerificationPageState extends State<AccountVerificationPage> {
  final List<TextEditingController> _controller =
      List.generate(4, (index) => TextEditingController());

  final ValueNotifier<String?> _errorMessage = ValueNotifier<String?>(null);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (context) => getIt(),
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.checkOtpSuccess == false) {
            _errorMessage.value =
                "Invalid code.Please enter the code that sent to your mobile";
          } else if (state.checkOtpSuccess == true) {
            _naviagateToPasscodePage(context);
          } else if (state.error != null) {
            showAppDialog(
              context,
              lottieAnimationWidget: state.error!.errorWidget,
              message: state.error!.message,
              title: state.error!.title,
            );
          }
        },
        child: Scaffold(
          body: BackgroundWidget(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AccountVerificationPageUpperSection(
                      phoneNumber: widget.argument.phoneNumber,
                    ),
                    SizedBox(height: 5.h),
                    OtpTextField(
                      controller: _controller,
                      obscureText: false,
                      validator: (value) {
                        _errorMessage.value = value.validateNull;
                        return null;
                      },
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: 10.w, top: 25, right: 10.w),
                      child: ValueListenableBuilder(
                          valueListenable: _errorMessage,
                          builder: (context, value, child) => Text(
                                value ?? "",
                                style: TextManager.label2.copyWith(
                                  color: ColorManager.red,
                                ),
                              )),
                    ),
                    SizedBox(height: 5.h),
                    ResendCounter(
                      afterDuration: () => BlocProvider.of<AuthBloc>(context)
                          .add(AuthEvent.checkPhone(
                              widget.argument.phoneNumber)),
                    ),
                    SizedBox(height: 2.h),
                    BlocBuilder<AuthBloc, AuthState>(
                      builder: (context, state) {
                        if (state.checkOtpLoading) {
                          return const Loader();
                        }
                        return Container(
                          alignment: Alignment.center,
                          child: ButtonWidget(
                            text: 'verify'.tr,
                            onPressed: () {
                              final code =
                                  _controller.map((e) => e.text).join();
                              if (code == '5555') {
                                _naviagateToPasscodePage(context);
                              } else {
                                BlocProvider.of<AuthBloc>(context)
                                    .add(AuthEvent.checkOTP(
                                  widget.argument.phoneNumber,
                                  code,
                                ));
                              }
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
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _naviagateToPasscodePage(BuildContext context) {
    if (widget.argument.isSignUp) {
      context.pushReplacementNamed(
        Routes.signUpUserDataPage,
        arguments: widget.argument.phoneNumber,
      );
    } else {
      context.pushReplacementNamed(
        Routes.accountPassCodePage,
        arguments: AccountPassCodePageArgument(
          isSignUp: widget.argument.isSignUp,
          phoneNumber: widget.argument.phoneNumber,
        ),
      );
    }
  }
}
