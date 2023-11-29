import 'package:flutter/material.dart';
import 'package:nesma/core/common/widgets/app_bar/nesma_app_bar.dart';
import 'package:nesma/core/common/widgets/background_widget.dart';
import 'package:nesma/core/common/widgets/glass_effect_widget.dart';
import 'package:nesma/core/extension/context_extension.dart';
import 'package:nesma/core/extension/string_extension.dart';
import 'package:nesma/core/managers/routes/routes.dart';
import 'package:nesma/core/managers/size_manager/corner_size.dart';
import 'package:nesma/core/managers/theme_manager/text_theme.dart';
import 'package:nesma/features/profile/presentation/page/add_or_edit_bank_account.dart';
import 'package:nesma/features/profile/presentation/widget/bank_account_widgets/bank_account_item_widget.dart';
import 'package:sizer/sizer.dart';

class BankAccountMainPage extends StatelessWidget {
  const BankAccountMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: NesmaAppbar(pageName: "bank_account".tr),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "saved_Banks".tr,
                        style: TextManager.headline1,
                      ),
                      GlassEffect(
                        borderRadius: CornerSize.s13,
                        withElevation: true,
                        child: InkWell(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 10),
                            child: const Text('+'),
                          ),
                          onTap: () {
                            context.pushNamed(
                              Routes.addOrEditBankAccountPage,
                              arguments: AddOrEditBankAccountPageArgument(
                                edit: false,
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 3.h),
                  BankAccountItemWidget(
                    onTap: () => context.pushNamed(
                      Routes.addOrEditBankAccountPage,
                      arguments: AddOrEditBankAccountPageArgument(
                        edit: true,
                      ),
                    ),
                  ),
                  BankAccountItemWidget(
                    onTap: () => context.pushNamed(
                      Routes.addOrEditBankAccountPage,
                      arguments: AddOrEditBankAccountPageArgument(
                        edit: true,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
