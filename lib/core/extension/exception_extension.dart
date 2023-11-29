import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';
import 'package:lottie/lottie.dart';
import 'package:nesma/core/common/enum/exceptions_enum.dart';
import 'package:nesma/core/exceptions/exceptions.dart';
import 'package:nesma/core/failure/failure.dart';
import 'package:nesma/core/managers/string_manager/assets_manager.dart';

extension ExceptionExtension on Exception {
  Failure get toFailure {
    if (this is AppException) {
      Logger().e({
        "message": (this as AppException).code.message,
        "title": (this as AppException).code.title,
      });
      return Failure(
        message: (this as AppException).code.message,
        title: (this as AppException).code.title,
        errorWidget: (this as AppException).code.errorWidget,
      );
    } else {
      Logger().e(this);
      return Failure(
        message: toString().replaceFirst("Exception: ", ""),
        title: 'Error',
        errorWidget: Lottie.asset(
          AssetsManager.error,
        ),
      );
    }
  }
}

extension ExceptionCodeExtension on ExceptionCode {
  String get message {
    switch (this) {
      case ExceptionCode.logoutFailed:
        return "can't log out due to some errors";
      case ExceptionCode.signupFailed:
        return 'Sign up failed while trying to create your account. Please try again later.';
      case ExceptionCode.loginFailed:
        return "Some error happened while trying to login";
      case ExceptionCode.unKnown:
        return "Unknown error";
      case ExceptionCode.noInternetConnection:
        return 'No Internet connection';
      case ExceptionCode.downloadFailed:
        return 'Download Failed';
      case ExceptionCode.mappingToModelException:
        return 'There was a wrong while mapping some data';
    }
  }

  String get title {
    switch (this) {
      case ExceptionCode.logoutFailed:
        return 'Logout Failed';
      case ExceptionCode.signupFailed:
        return 'Sign up Failed';
      case ExceptionCode.loginFailed:
        return 'Login Failed';
      case ExceptionCode.unKnown:
        return "Error";
      case ExceptionCode.noInternetConnection:
        return "No Internet";
      case ExceptionCode.mappingToModelException:
      case ExceptionCode.downloadFailed:
        return "Error";
    }
  }

  Widget get errorWidget {
    switch (this) {
      case ExceptionCode.logoutFailed:
      case ExceptionCode.signupFailed:
      case ExceptionCode.loginFailed:
      case ExceptionCode.unKnown:
      case ExceptionCode.downloadFailed:
      case ExceptionCode.mappingToModelException:
        return Lottie.asset(AssetsManager.error, fit: BoxFit.fill);
      case ExceptionCode.noInternetConnection:
        return Lottie.asset(AssetsManager.noInternet, fit: BoxFit.fill);
    }
  }
}
