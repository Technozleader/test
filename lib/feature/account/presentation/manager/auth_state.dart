part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    Failure? error,
    bool? success,
    bool? checkPhoneLoading,
    bool? loginLoading,
    bool? signupLoading,
    @Default(false) bool checkOtpLoading,
     bool? checkOtpSuccess,
  }) = _AuthState;
}
