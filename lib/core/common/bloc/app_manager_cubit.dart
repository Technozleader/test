import 'dart:io';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:logger/logger.dart';
import 'package:nesma/core/common/entities/user/User_global.dart';
import 'package:nesma/core/common/enum/app_enums.dart';
import 'package:nesma/core/common/models/user/user_model.dart';
import 'package:nesma/core/managers/cash_manager/cash_keys.dart';
import 'package:nesma/core/managers/manager.dart';
import 'package:nesma/core/managers/string_manager/constant_manager.dart';
import 'package:nesma/core/network/api/api.dart';
import 'package:path_provider/path_provider.dart';

part 'app_manager_state.dart';

class AppManagerCubit extends Cubit<AppManagerState> {
  AppManagerCubit() : super(const AppManagerState());

  Locale locale = const Locale('en');

  Future<void> init() async {
    await loadLocalizations();
    await loadUserData();
    Logger().i('AppManagerCubit init');
    String path = '${(await getApplicationDocumentsDirectory()).path}'
        '/${ConstantManager.backgroundImageName}';
    Logger().i(path);
    if (File(path).existsSync()) {
      emit(state.copyWith(backgroundImagePath: path));
    }
    await fetchNewImage();
  }

  Future<void> fetchNewImage() async {
    await Managers.api
        .download(ApiURL.backgroundImage, ConstantManager.backgroundImageName);
  }

  Future<void> loadUserData() async {
    final userData = await Managers.cashManager.get<Map>(CashKeys.user);
    final firstOpenForTheApp =
        await Managers.cashManager.get<bool>(CashKeys.firstTime);
    if (userData != null) {
      User.instance.userEntity =
          UserModel.fromJson(userData as Map<String, dynamic>);
      emit(state.copyWith(
        appFlow: AppFlow.loggedIn,
      ));
    } else if (firstOpenForTheApp == null) {
      emit(state.copyWith(
        appFlow: AppFlow.firstTime,
      ));
    } else {
      emit(state.copyWith(
        appFlow: AppFlow.notLoggedIn,
      ));
    }
  }

  void logout() {
    emit(state.copyWith(
      appFlow: AppFlow.notLoggedIn,
    ));
  }

  //To change user type logged in or not. This will change
  //the appFlow state.
  void changeUserType(AppFlow appFlow) {
    emit(state.copyWith(appFlow: appFlow, stateDetails: appFlow.name));
  }

  void changeLocale(String newLocale) {
    Managers.cashManager.store(CashKeys.locale, newLocale);
    locale = Locale(newLocale);
    emit(
      state.copyWith(
        locale: locale,
      ),
    );
  }

  Future<void> loadLocalizations() async {
    Managers.cashManager.get(CashKeys.locale).then((value) {
      if (value != null) {
        locale = Locale(value as String);
        emit(
          state.copyWith(
            locale: locale,
          ),
        );
      }
    });
  }
}
