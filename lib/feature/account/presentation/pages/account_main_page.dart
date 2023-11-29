import 'package:flutter/material.dart';
import 'package:nesma/core/common/widgets/background_widget.dart';
import 'package:nesma/features/account/presentation/widgets/account_main_page_widgets/account_main_page_button_section.dart';
import 'package:nesma/features/account/presentation/widgets/account_main_page_widgets/account_main_page_upper_section.dart';

class AccountMainPage extends StatelessWidget {
  const AccountMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                AccountMainPageUpperSection(),
                AccountMainPageButtonSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
