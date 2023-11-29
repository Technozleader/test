part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.checkPhone(String phoneNumber) = _CheckPhone;

  const factory AuthEvent.login(String phone, String password) = _Login;

  const factory AuthEvent.signup(SignupParameters parameters) = _Signup;

  const factory AuthEvent.checkOTP(String phoneNumber, String code) = _CheckOTP;
}
