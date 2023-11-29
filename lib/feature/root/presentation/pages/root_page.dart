import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nesma/core/common/bloc/app_manager_cubit.dart';
import 'package:nesma/core/common/enum/app_enums.dart';
import 'package:nesma/features/account/presentation/pages/account_main_page.dart';
import 'package:nesma/features/account/presentation/pages/sign_up_page.dart';
import 'package:nesma/features/home/presentation/pages/main_page.dart';

class RootPage extends StatelessWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //This builder is listening to app manager state
    //It change the current page in case there is any change in user.
    return BlocBuilder<AppManagerCubit, AppManagerState>(
      buildWhen: (old, current) => old.appFlow != current.appFlow,
      builder: (context, state) {
        print(state);
        switch (state.appFlow) {
          case AppFlow.notLoggedIn:
            return SignUpPage(
              argument: SignUpPageArgument(
                isSignUp: false,
              ),
            );
          case AppFlow.loggedIn:
            return const MainPage();
          case AppFlow.firstTime:
            return const AccountMainPage();
        }
      },
    );
  }
}
