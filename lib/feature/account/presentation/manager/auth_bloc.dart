import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nesma/core/failure/failure.dart';
import 'package:nesma/features/account/domain/use_cases/check_otp.dart';
import 'package:nesma/features/account/domain/use_cases/check_phone_use_case.dart';
import 'package:nesma/features/account/domain/use_cases/login.dart';
import 'package:nesma/features/account/domain/use_cases/sign_up.dart';
import 'package:nesma/features/account/parameters/signup_parameters.dart';

part 'auth_event.dart';

part 'auth_state.dart';

part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final CheckPhoneUseCase checkPhoneUseCase;
  final LoginUseCase loginUseCase;
  final SignupUseCase signupUseCase;
  final CheckOTPUseCase checkOTPUseCase;

  AuthBloc({
    required this.checkPhoneUseCase,
    required this.loginUseCase,
    required this.signupUseCase,
    required this.checkOTPUseCase,
  }) : super(const AuthState()) {
    on<AuthEvent>((event, emit) async {
      switch (event.runtimeType) {
        case _$_CheckPhone:
          await checkPhone(event, emit);
          break;
        case _$_Login:
          await login(event, emit);
          break;
        case _$_Signup:
          await signup(event, emit);
          break;
        case _$_CheckOTP:
          await checkOTP(event, emit);
          break;
      }
    });
  }

  Future<void> checkPhone(AuthEvent event, Emitter<AuthState> emit) async {
    event as _$_CheckPhone;
    emit(state.copyWith(
      checkPhoneLoading: true,
      error: null,
      success: null,
    ));
    final result = await checkPhoneUseCase(event.phoneNumber);
    result.fold((failure) {
      emit(state.copyWith(
        checkPhoneLoading: false,
        error: failure,
        success: null,
      ));
    }, (success) {
      emit(state.copyWith(
        checkPhoneLoading: false,
        error: null,
        success: success,
      ));
    });
  }

  Future<void> login(AuthEvent event, Emitter<AuthState> emit) async {
    event as _$_Login;
    emit(state.copyWith(
      loginLoading: true,
      error: null,
      success: null,
    ));
    final result = await loginUseCase(event.phone, event.password);
    result.fold((failure) {
      emit(state.copyWith(
        loginLoading: false,
        error: failure,
        success: null,
      ));
    }, (success) {
      emit(state.copyWith(
        loginLoading: false,
        error: null,
        success: true,
      ));
    });
  }

  Future<void> signup(AuthEvent event, Emitter<AuthState> emit) async {
    event as _$_Signup;
    emit(state.copyWith(
      signupLoading: true,
      error: null,
      success: null,
    ));
    final result = await signupUseCase(event.parameters);
    result.fold((failure) {
      emit(state.copyWith(
        signupLoading: false,
        error: failure,
        success: null,
      ));
    }, (success) {
      emit(state.copyWith(
        signupLoading: false,
        error: null,
        success: true,
      ));
    });
  }

  Future<void> checkOTP(AuthEvent event, Emitter<AuthState> emit) async {
    event as _$_CheckOTP;
    emit(state.copyWith(
      checkOtpLoading: true,
      error: null,
    ));
    final result = await checkOTPUseCase(
      phoneNumber: event.phoneNumber,
      code: event.code,
    );
    result.fold((failure) {
      emit(state.copyWith(
        checkOtpLoading: false,
        error: failure,
      ));
    }, (success) {
      emit(state.copyWith(
        checkOtpLoading: false,
        checkOtpSuccess: success,
        error: null,
      ));
    });
  }
}
