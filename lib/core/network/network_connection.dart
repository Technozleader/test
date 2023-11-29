import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:logger/logger.dart';
import 'package:nesma/core/common/enum/exceptions_enum.dart';
import 'package:nesma/core/exceptions/exceptions.dart';

abstract class NetworkConnection {
  Future<bool> hasInternetConnection();

  Stream<bool> hasInternet();
}

class NetworkConnectionImpl implements NetworkConnection {
  final Connectivity checker = Connectivity();

  @override
  Future<bool> hasInternetConnection() async {
    try {
      final hasConnection = await checker.checkConnectivity();
      return hasConnection != ConnectivityResult.none;
    } on Exception catch (_) {
      throw const AppException(ExceptionCode.noInternetConnection);
    }
  }

  @override
  Stream<bool> hasInternet() {
    return checker.onConnectivityChanged
        .map((ConnectivityResult event) {
          final hasInternet =  event != ConnectivityResult.none;
          if(hasInternet){
            Logger().i('Connected to ${event.name}');
          }else {
            Logger().e("Didn't have network connection");
          }
          return hasInternet;
        });
  }
}
