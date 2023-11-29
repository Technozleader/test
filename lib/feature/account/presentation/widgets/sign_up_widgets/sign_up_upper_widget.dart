import 'package:flutter/material.dart';
import 'package:nesma/core/common/widgets/localization_widget.dart';
import 'package:nesma/core/extension/string_extension.dart';
import 'package:nesma/core/managers/theme_manager/text_theme.dart';
import 'package:sizer/sizer.dart';

class AccountSignUpPageUpperSection extends StatelessWidget {
  const AccountSignUpPageUpperSection({
    Key? key,
    required this.signUpPage,
  }) : super(key: key);
  final bool signUpPage;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              signUpPage ? "sign_up".tr : "sign_in".tr,
              style: TextManager.headline2,
            ),
            const LocalizationWidget(),
          ],
        ),
        SizedBox(height: 4.h),
         Text(
          "we_well_send_you_code".tr,
          style: TextManager.accountSubtitle,
        ),
      ],
    );
  }
}
