import 'package:flutter/material.dart';
import 'package:nesma/core/common/widgets/localization_widget.dart';
import 'package:nesma/core/extension/string_extension.dart';
import 'package:nesma/core/managers/theme_manager/text_theme.dart';
import 'package:sizer/sizer.dart';

class AccountMainPageUpperSection extends StatelessWidget {
  const AccountMainPageUpperSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:  [
              Text(
                "welcome_back".tr,
                style: TextManager.headline2,
              ),
              const LocalizationWidget(),
            ],
          ),
          SizedBox(height: 4.h),
           Text(
            'welcome_screen_text'.tr,
            style: TextManager.accountSubtitle,
          ),
        ],
      ),
    );
  }
}
