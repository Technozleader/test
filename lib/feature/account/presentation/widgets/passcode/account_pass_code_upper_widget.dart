import 'package:flutter/material.dart';
import 'package:nesma/core/extension/string_extension.dart';
import 'package:nesma/core/managers/theme_manager/text_theme.dart';
import 'package:sizer/sizer.dart';

class AccountPassCodePageUpperSection extends StatelessWidget {
  const AccountPassCodePageUpperSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "passcode".tr,
          style: TextManager.headline2,
        ),
        SizedBox(height: 4.h),
        Text(
          "enter_your_pass_code_and_start_earning_cashback_upon_your_purchases"
              .tr,
          style: TextManager.accountSubtitle,
        ),
      ],
    );
  }
}
