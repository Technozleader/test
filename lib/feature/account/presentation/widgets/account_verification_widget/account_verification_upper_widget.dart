import 'package:flutter/material.dart';
import 'package:nesma/core/extension/string_extension.dart';
import 'package:nesma/core/managers/colors/color_manager.dart';
import 'package:nesma/core/managers/theme_manager/text_theme.dart';
import 'package:sizer/sizer.dart';

class AccountVerificationPageUpperSection extends StatelessWidget {
  final String phoneNumber;

  const AccountVerificationPageUpperSection({
    Key? key,
    required this.phoneNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text(
          "verification".tr,
          style: TextManager.headline2,
        ),
        SizedBox(height: 4.h),
        RichText(
          text: TextSpan(
            text: "enter_the_4_digit_code_we_sent_on_your_number".tr,
            style: TextManager.accountSubtitle,
            children: [
              TextSpan(
                text: phoneNumber,
                style: TextManager.accountSubtitle
                    .copyWith(color: ColorManager.black),
              )
            ],
          ),
        )
      ],
    );
  }
}
