import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:nesma/core/common/dialog/show_dialog.dart';
import 'package:nesma/core/common/entities/user/User_global.dart';
import 'package:nesma/core/common/widgets/app_bar/nesma_app_bar.dart';
import 'package:nesma/core/common/widgets/background_widget.dart';
import 'package:nesma/core/common/widgets/button_widget.dart';
import 'package:nesma/core/common/widgets/loader.dart';
import 'package:nesma/core/common/widgets/text_field/nesma_text_field.dart';
import 'package:nesma/core/extension/context_extension.dart';
import 'package:nesma/core/extension/string_extension.dart';
import 'package:nesma/core/managers/colors/color_manager.dart';
import 'package:nesma/core/managers/string_manager/assets_manager.dart';
import 'package:nesma/core/managers/theme_manager/text_theme.dart';
import 'package:nesma/core/service_locator.dart';
import 'package:nesma/features/profile/data/parameters/parameters.dart';
import 'package:nesma/features/profile/presentation/manager/profile_manager_bloc.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final EditProfileParameters parameter = EditProfileParameters(
    name: User.instance.userEntity?.name,
    email: User.instance.userEntity?.email,
    phone: User.instance.userEntity?.phone,
    lastName: User.instance.userEntity?.lastName,
  );
  final EditProfileParameters staticParameter = EditProfileParameters(
    name: User.instance.userEntity?.name,
    email: User.instance.userEntity?.email,
    phone: User.instance.userEntity?.phone,
    lastName: User.instance.userEntity?.lastName,
  );

  @override
  Widget build(BuildContext context) {
    final user = User.instance.userEntity;
    return BlocProvider(
      create: (context) => getIt<ProfileManagerBloc>(),
      child: BlocListener<ProfileManagerBloc, ProfileManagerState>(
        listener: (context, state) {
          if (state.editProfileSuccess) {
            showAppDialog(context,
                title: 'success'.tr,
                message: 'profile_has_been_edited_successfully'.tr,
                buttonText: 'ok'.tr,
                lottieAnimationWidget: Lottie.asset(
                  AssetsManager.success,
                  width: 40,
                ));
          } else if (state.failure != null) {
            showAppDialog(
              context,
              title: state.failure!.message,
              message: state.failure!.message,
              lottieAnimationWidget: state.failure!.errorWidget,
            );
          }
        },
        child: BackgroundWidget(
          child: Scaffold(
            extendBodyBehindAppBar: true,
            appBar:  NesmaAppbar(
              pageName: 'edit_profile'.tr,
            ),
            body: BackgroundWidget(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.transparent,
                      backgroundImage: user?.profileImage.toImageProvider(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 27),
                      child: NesmaTextField(
                        width: context.width * 0.8,
                        hintText: 'name'.tr,
                        initialValue: user?.name,
                        onChanged: (value) {
                          parameter.name = value;
                          setState(() {});
                        },
                      ),
                    ),
                    NesmaTextField(
                      width: context.width * 0.8,
                      hintText: 'last_name'.tr,
                      initialValue: user?.lastName,
                      onChanged: (value) {
                        parameter.lastName = value;
                        setState(() {});
                      },
                    ),
                    NesmaTextField(
                      width: context.width * 0.8,
                      hintText: 'Example@gmail.com',
                      initialValue: user?.email,
                      onChanged: (value) {
                        parameter.email = value;
                        setState(() {});
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 76),
                      child: ButtonWidget(
                        options: ButtonOption(
                            width: context.width * 0.5,
                            color: ColorManager.white,
                            textStyle: TextManager.bodyText1.copyWith(
                                color: ColorManager.black, fontSize: 16)),
                        text: 'change_phone_number'.tr,
                        onPressed: () {},
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child:
                          BlocBuilder<ProfileManagerBloc, ProfileManagerState>(
                        builder: (context, state) {
                          if (state.editProfileLoading) {
                            return const Loader();
                          }
                          return ButtonWidget(
                            options: staticParameter != parameter
                                ? ButtonOption(
                                    width: context.width * 0.5,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 25,
                                      vertical: 8,
                                    ),
                                    color: ColorManager.black,
                                    textStyle: TextManager.bodyText1.copyWith(
                                      color: ColorManager.white,
                                      fontWeight: FontWeight.w400,
                                    ))
                                : ButtonOption(
                                    width: context.width * 0.5,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 25,
                                      vertical: 8,
                                    ),
                                    color: ColorManager.grey3,
                                    textStyle: TextManager.bodyText1.copyWith(
                                      color: ColorManager.grey,
                                      fontWeight: FontWeight.w400,
                                    )),
                            text: 'save_changes'.tr,
                            onPressed: () {
                              if (staticParameter != parameter) {
                                BlocProvider.of<ProfileManagerBloc>(context)
                                    .add(ProfileManagerEvent.editProfile(
                                  parameters: parameter.compareAndReturnNull(
                                    staticParameter,
                                  ),
                                ));
                              }
                            },
                          );
                        },
                      ),
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
}
