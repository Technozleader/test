import 'package:flutter/material.dart';
import 'package:nesma/core/common/widgets/app_bar/nesma_app_bar.dart';
import 'package:nesma/core/common/widgets/background_widget.dart';
import 'package:nesma/core/extension/string_extension.dart';
import 'package:nesma/core/managers/theme_manager/text_theme.dart';
import 'package:nesma/features/profile/presentation/widget/wallet_widgets/wallet_list_item.dart';
import 'package:nesma/features/profile/presentation/widget/wallet_widgets/wallet_upper_widget.dart';
import 'package:sizer/sizer.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar:  NesmaAppbar(pageName: "wallet".tr),
      body: BackgroundWidget(
        child: Padding(
          padding: EdgeInsets.only(bottom: 12.h),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 3.h),
                  const WalletUpperWidget(),
                  SizedBox(height: 6.h),
                   Text("gained_and_spend".tr, style: TextManager.headline1),
                  SizedBox(height: 3.h),
                  const WalletListItem(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
