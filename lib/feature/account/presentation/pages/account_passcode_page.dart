import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nesma/core/common/bloc/app_manager_cubit.dart';
import 'package:nesma/core/common/dialog/show_dialog.dart';
import 'package:nesma/core/common/enum/app_enums.dart';
import 'package:nesma/core/common/widgets/background_widget.dart';
import 'package:nesma/core/common/widgets/button_widget.dart';
import 'package:nesma/core/common/widgets/loader.dart';
import 'package:nesma/core/common/widgets/text_field/otp_text_field/otp_text_field.dart';
import 'package:nesma/core/extension/context_extension.dart';
import 'package:nesma/core/extension/string_extension.dart';
import 'package:nesma/core/managers/colors/color_manager.dart';
import 'package:nesma/core/managers/routes/routes.dart';
import 'package:nesma/core/managers/theme_manager/text_theme.dart';
import 'package:nesma/core/service_locator.dart';
import 'package:nesma/features/account/parameters/signup_parameters.dart';
import 'package:nesma/features/account/presentation/manager/auth_bloc.dart';
import 'package:nesma/features/account/presentation/widgets/passcode/account_pass_code_footer.dart';
import 'package:nesma/features/account/presentation/widgets/passcode/account_pass_code_upper_widget.dart';
import 'package:sizer/sizer.dart';

class AccountPassCodePageArgument {
  final bool isSignUp;
  final String phoneNumber;
  final String? email;
  final String? firstName;
  final String? lastName;

  AccountPassCodePageArgument({
    required this.isSignUp,
    required this.phoneNumber,
    this.email,
    this.firstName,
    this.lastName,
  });
}

class AccountPassCodePage extends StatefulWidget {
  const AccountPassCodePage({
    Key? key,
    required this.argument,
  }) : super(key: key);
  final AccountPassCodePageArgument argument;

  @override
  State<AccountPassCodePage> createState() => _AccountPassCodePageState();
}

class _AccountPassCodePageState extends State<AccountPassCodePage> {
  final List<TextEditingController> _controller =
      List.generate(6, (index) => TextEditingController());

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
            if (!widget.argument.isSignUp) {
              BlocProvider.of<AppManagerCubit>(context)
                  .changeUserType(AppFlow.loggedIn);
              context.replaceAll(Routes.rootPage);
            } else {
              context.replaceAll(
                Routes.accountPassCodePage,
                arguments: AccountPassCodePageArgument(
                  isSignUp: false,
                  phoneNumber: widget.argument.phoneNumber,
                ),
              );
            }
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
                    const AccountPassCodePageUpperSection(),
                    SizedBox(height: 5.h),
                    OtpTextField(
                      controller: _controller,
                      obscureText: true,
                    ),
                    SizedBox(height: 5.h),
                    Container(
                      alignment: Alignment.center,
                      child: BlocBuilder<AuthBloc, AuthState>(
                        builder: (context, state) {
                          if (state.loginLoading == true ||
                              state.signupLoading == true) {
                            return const Loader();
                          }
                          return ButtonWidget(
                            text: widget.argument.isSignUp
                                ? 'sign_up'.tr
                                : 'sign_in'.tr,
                            onPressed: () {
                              final password =
                                  _controller.map((e) => e.text).join();
                              if (widget.argument.isSignUp) {
                                BlocProvider.of<AuthBloc>(context)
                                    .add(AuthEvent.signup(SignupParameters(
                                  phone: widget.argument.phoneNumber,
                                  password: password,
                                  email: widget.argument.email ?? '',
                                  name: widget.argument.firstName ?? '',
                                  lastName: widget.argument.lastName ?? '',
                                )));
                              } else {
                                BlocProvider.of<AuthBloc>(context).add(
                                  AuthEvent.login(
                                    widget.argument.phoneNumber,
                                    password,
                                  ),
                                );
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
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 5.h),
                    if (!widget.argument.isSignUp) const PassCodeFooter(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
