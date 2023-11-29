import 'package:flutter/material.dart';
import 'package:nesma/core/common/entities/user/User_global.dart';
import 'package:nesma/core/common/widgets/localization_widget.dart';
import 'package:nesma/core/extension/context_extension.dart';
import 'package:nesma/core/managers/routes/routes.dart';
import 'package:nesma/core/managers/size_manager/font_size_manager.dart';
import 'package:nesma/core/managers/string_manager/assets_manager.dart';
import 'package:nesma/core/managers/theme_manager/text_theme.dart';

class ProfileHeaderWidget extends StatefulWidget {
  const ProfileHeaderWidget({Key? key}) : super(key: key);

  @override
  State<ProfileHeaderWidget> createState() => _ProfileHeaderWidgetState();
}

class _ProfileHeaderWidgetState extends State<ProfileHeaderWidget> {
  @override
  Widget build(BuildContext context) {
    final user = User.instance.userEntity;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () =>
                context.pushNamed(Routes.editProfilePage).then((value) =>
                    setState((){})),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      '${user?.name ?? ''} ${user?.lastName ?? ''}',
                      style: TextManager.headline1.copyWith(
                        fontSize: FontSizeManager.s27,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 13,
                      ),
                      child: Image.asset(
                        AssetsManager.edit,
                        width: 20,
                      ),
                    )
                  ],
                ),
                Text(
                  '${user?.phone == null ? '' : '+'}${user?.phone ?? ''}',
                  style: TextManager.accountSubtitle
                      .copyWith(fontWeight: FontWeight.w300),
                )
              ],
            ),
          ),
           const LocalizationWidget(),
        ],
      ),
    );
  }
}


