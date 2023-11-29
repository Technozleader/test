import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nesma/core/common/bloc/app_manager_cubit.dart';
import 'package:nesma/core/localization/app_localization.dart';
import 'package:nesma/core/managers/routes/routes.dart';
import 'package:nesma/core/managers/routes/routes_manager.dart';
import 'package:nesma/core/managers/string_manager/constant_manager.dart';
import 'package:nesma/core/managers/theme_manager/theme_manager.dart';
import 'package:nesma/core/network/network_connection.dart';
import 'package:nesma/core/service_locator.dart';
import 'package:nesma/features/home/presentation/managers/home_bloc/home_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class MyApp extends StatelessWidget {
  const MyApp._internal();

  static const MyApp instance = MyApp._internal();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (c) => getIt<AppManagerCubit>()..init(),
        ),
        BlocProvider(
          create: (c) => getIt<HomeBloc>(),
        )
      ],
      child: BlocBuilder<AppManagerCubit, AppManagerState>(
        builder: (context, state) {
          return Sizer(
            builder: (context, orientation, deviceType) {
              return StreamBuilder<bool>(
                  stream: getIt<NetworkConnection>().hasInternet(),
                  builder: (context, snapshot) {
                    return MaterialApp(
                      locale: state.locale,

                      localizationsDelegates: const [
                        AppLocalization.delegate,
                        GlobalMaterialLocalizations.delegate,
                        GlobalCupertinoLocalizations.delegate,
                        GlobalWidgetsLocalizations.delegate,
                      ],
                      supportedLocales: AppLocalization.languages().map(
                        (e) => Locale(
                          e,
                        ),
                      ),
                      title: ConstantManager.appName,
                      color: Colors.transparent,
                      debugShowCheckedModeBanner: false,
                      initialRoute: Routes.rootPage,
                      onGenerateRoute: RoutesManager().generateRoute,
                      theme: ThemeManager.themeData,
                    );
                  });
            },
          );
        },
      ),
    );
  }
}
