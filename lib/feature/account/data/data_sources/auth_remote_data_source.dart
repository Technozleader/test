import 'package:nesma/core/common/entities/user/User_global.dart';
import 'package:nesma/core/common/entities/user/user_entity.dart';
import 'package:nesma/core/common/enum/api_enums.dart';
import 'package:nesma/core/common/enum/exceptions_enum.dart';
import 'package:nesma/core/common/models/user/user_model.dart';
import 'package:nesma/core/exceptions/exceptions.dart';
import 'package:nesma/core/managers/manager.dart';
import 'package:nesma/core/network/api/api.dart';
import 'package:nesma/features/account/parameters/signup_parameters.dart';

abstract class AuthRemoteDataSource {
  ///Check phone number before register
  ///and depending on response redirection will happened.
  Future<bool> checkPhone(String phoneNumber);

  ///Login with Phone number and Password.
  Future<UserEntity> login(String phone, String password);

  ///Create account using user data.
  Future<UserEntity> signup(SignupParameters parameters);

  ///Call the login api to remove user from DB.
  Future<void> logout();

  ///Deactivate account.
  Future<void> deactivateAccount();

  ///Check the otp if it's valid or not.
  Future<bool> checkOTP({required String phoneNumber, required String otp,});
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<bool> checkPhone(String phoneNumber) async {
    final request = ApiRequest(
      url: ApiURL.checkPhone,
      requestType: RequestType.get,
      params: ApiParameters.checkPhone(phoneNumber),
      headers: ApiParameters.headers(),
    );
    final response = await Managers.api.request(request);
    final success = (response.body?['data'] as Map?)?['exists'];
    if (success is bool) {
      return success;
    } else {
      throw const AppException(
        ExceptionCode.unKnown,
      );
    }
  }

  @override
  Future<UserEntity> login(String phone, String password) async {
    final request = ApiRequest(
      url: ApiURL.login,
      requestType: RequestType.post,
      params: ApiParameters.login(phone, password),
      headers: ApiParameters.headers(),
    );
    final response = await Managers.api.request(request);
    if (response.success) {
      final result = Managers.mapper.mapFromJson(
        (response.body ?? {}) as Map<String, dynamic>,
            (json) => UserModel.fromJson(json),
      );
      return result;
    } else {
      throw AppException(
        ExceptionCode.loginFailed,
        message: response.body?['message'],
      );
    }
  }

  @override
  Future<UserEntity> signup(SignupParameters parameters) async {
    final request = ApiRequest(
      url: ApiURL.singUp,
      requestType: RequestType.post,
      params: ApiParameters.signup(parameters),
      headers: ApiParameters.headers(),
    );
    final response = await Managers.api.request(request);
    if (response.success) {
      final result = Managers.mapper.mapFromJson(
        (response.body ?? {}) as Map<String, dynamic>,
            (json) => UserModel.fromJson(json),
      );
      return result;
    } else {
      throw AppException(
        ExceptionCode.signupFailed,
        message: response.body?['message'],
      );
    }
  }

  @override
  Future<void> logout() async {
    final request = ApiRequest(
      url: ApiURL.logout,
      requestType: RequestType.delete,
      headers: ApiParameters.headers(
        token: User.instance.userEntity?.token,
      ),
      params: ApiParameters.userId(
        (User.instance.userEntity?.id ?? '').toString(),
      ),
    );
    final response = await Managers.api.request(request);
    if (response.success && response.successInBode) {
      return;
    } else {
      throw AppException(
        ExceptionCode.logoutFailed,
        message: response.body?['message'],
      );
    }
  }

  @override
  Future<void> deactivateAccount() async {
    final request = ApiRequest(
      url: ApiURL.deactivateAccount,
      requestType: RequestType.delete,
      headers: ApiParameters.headers(
        token: User.instance.userEntity?.token,
      ),
      params: ApiParameters.userId(
        (User.instance.userEntity?.id ?? '').toString(),
      ),
    );
    final response = await Managers.api.request(request);
    if (response.success && response.successInBode) {
      return;
    } else {
      throw Exception(response.body?['message'] ?? 'Error');
    }
  }

  @override
  Future<bool> checkOTP({required String phoneNumber, required String otp}) async {
    final request = ApiRequest(
        url: ApiURL.checkOTP,
        params: ApiParameters.checkOTP(phoneNumber, otp),
        headers: ApiParameters.headers(
          token: User.instance.userEntity?.token,
        ),
      requestType: RequestType.post,
    );
    final response = await Managers.api.request(request);
    if(response.success){
      return (response.body?['data'] as Map<String , dynamic>)['success'];
    }else {
      throw Exception(response.body?['message'] ?? 'Error');
    }
  }
}
