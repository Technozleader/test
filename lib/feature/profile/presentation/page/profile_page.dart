import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nesma/core/common/bloc/app_manager_cubit.dart';
import 'package:nesma/core/common/dialog/show_dialog.dart';
import 'package:nesma/core/common/widgets/background_widget.dart';
import 'package:nesma/core/common/widgets/loader.dart';
import 'package:nesma/core/extension/context_extension.dart';
import 'package:nesma/core/extension/string_extension.dart';
import 'package:nesma/core/managers/routes/routes.dart';
import 'package:nesma/core/managers/string_manager/assets_manager.dart';
import 'package:nesma/core/managers/theme_manager/text_theme.dart';
import 'package:nesma/core/service_locator.dart';
import 'package:nesma/features/change_passcode/presentation/pages/change_password_page.dart';
import 'package:nesma/features/profile/presentation/manager/profile_manager_bloc.dart';
import 'package:nesma/features/profile/presentation/widget/profile_container_widget.dart';
import 'package:nesma/features/profile/presentation/widget/profile_header_widget.dart';
import 'package:sizer/sizer.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileManagerBloc>(
      create: (context) => getIt<ProfileManagerBloc>(),
      child: BlocListener<ProfileManagerBloc, ProfileManagerState>(
        listener: (context, state) {
          if (state.logoutSuccess == true ||
              state.deactivateAccountSuccess == true) {
            BlocProvider.of<AppManagerCubit>(context).logout();
          } else if (state.failure != null) {
            showAppDialog(
              context,
              title: state.failure!.title,
              message: state.failure!.message,
              lottieAnimationWidget: state.failure!.errorWidget,
            );
          }
        },
        child: BlocBuilder<AppManagerCubit, AppManagerState>(
          builder: (context, state) {
            return Scaffold(
              backgroundColor: Colors.white.withOpacity(0),
              resizeToAvoidBottomInset: false,
              body: BackgroundWidget(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 12.h),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const ProfileHeaderWidget(),
                          SizedBox(height: 2.h),
                          Text("financial".tr, style: TextManager.headline2),
                          SizedBox(height: 3.h),
                          ProfileWidgetsContainer(
                            containerChild: [
                              OptionWidget(
                                onTap: () {
                                  context.pushNamed(Routes.walletPage);
                                },
                                icon: SvgPicture.asset(
                                    AssetsManager.profileWallet),
                                text: "wallet".tr,
                              ),
                              OptionWidget(
                                onTap: () {
                                  context.pushNamed(Routes.creditCardMainPage);
                                },
                                icon:
                                    SvgPicture.asset(AssetsManager.creditCards),
                                text: "credit_cards".tr,
                              ),
                              OptionWidget(
                                icon: SvgPicture.asset(AssetsManager.bank),
                                text: "bank_accounts".tr,
                                onTap: () {
                                  context.pushNamed(Routes.bankAccountMainPage);
                                },
                              ),
                            ],
                          ),
                          SizedBox(height: 3.h),
                          Text(
                            "settings".tr,
                            style: TextManager.headline2,
                          ),
                          SizedBox(height: 3.h),
                          ProfileWidgetsContainer(
                            containerChild: [
                              OptionWidget(
                                icon: SvgPicture.asset(AssetsManager.lock),
                                text: "change_password".tr,
                                onTap: () {
                                  context.pushNamed(
                                    Routes.changePasswordCodePage,
                                    arguments: ChangePasswordCodePageArgument(
                                      type: ChangePasswordScreenType.verify,
                                      fieldNumber: 4,
                                    ),
                                  );
                                },
                              ),
                              OptionWidget(
                                icon: SvgPicture.asset(AssetsManager.faq),
                                text: "faq".tr,
                                onTap: () {
                                  context.pushNamed(Routes.faqPage);
                                },
                              ),
                              OptionWidget(
                                icon: SvgPicture.asset(AssetsManager.privacy),
                                text: "privacy_policy".tr,
                                onTap: () {
                                  context.pushNamed(Routes.privacyPolicy);
                                },
                              ),
                              OptionWidget(
                                icon: SvgPicture.asset(AssetsManager.info),
                                text: "about_us".tr,
                                onTap: () {},
                              ),
                              OptionWidget(
                                icon:
                                    SvgPicture.asset(AssetsManager.helpCenter),
                                text: "help_center".tr,
                                onTap: () {
                                  context.pushNamed(Routes.helpCenter);

                                },
                              ),
                            ],
                          ),
                          SizedBox(height: 3.h),
                          Text("account".tr, style: TextManager.headline2),
                          SizedBox(height: 3.h),
                          BlocBuilder<ProfileManagerBloc, ProfileManagerState>(
                            builder: (context, state) {
                              if (state.logoutLoading == true ||
                                  state.deactivateAccountLoading == true) {
                                return const Loader(
                                  height: 40,
                                  width: 40,
                                );
                              }
                              return ProfileWidgetsContainer(
                                containerChild: [
                                  OptionWidget(
                                    icon: SvgPicture.asset(
                                        AssetsManager.deactivate),
                                    text: "deactivate_account".tr,
                                    onTap: () {
                                      BlocProvider.of<ProfileManagerBloc>(
                                              context)
                                          .add(
                                        const ProfileManagerEvent
                                            .deactivateAccount(),
                                      );
                                    },
                                  ),
                                  OptionWidget(
                                    icon:
                                        SvgPicture.asset(AssetsManager.logOut),
                                    text: "log_out".tr,
                                    onTap: () {
                                      BlocProvider.of<ProfileManagerBloc>(
                                              context)
                                          .add(const ProfileManagerEvent
                                              .logout());
                                    },
                                  ),
                                ],
                              );
                            },
                          ),
                          SizedBox(height: 3.h),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 3.h),
                            alignment: Alignment.center,
                            child: Text(
                              "${'app_version'.tr} 1.0.0",
                              style: TextManager.cardLightFont,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
