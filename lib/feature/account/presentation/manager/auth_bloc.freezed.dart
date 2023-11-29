// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phoneNumber) checkPhone,
    required TResult Function(String phone, String password) login,
    required TResult Function(SignupParameters parameters) signup,
    required TResult Function(String phoneNumber, String code) checkOTP,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phoneNumber)? checkPhone,
    TResult? Function(String phone, String password)? login,
    TResult? Function(SignupParameters parameters)? signup,
    TResult? Function(String phoneNumber, String code)? checkOTP,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneNumber)? checkPhone,
    TResult Function(String phone, String password)? login,
    TResult Function(SignupParameters parameters)? signup,
    TResult Function(String phoneNumber, String code)? checkOTP,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckPhone value) checkPhone,
    required TResult Function(_Login value) login,
    required TResult Function(_Signup value) signup,
    required TResult Function(_CheckOTP value) checkOTP,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckPhone value)? checkPhone,
    TResult? Function(_Login value)? login,
    TResult? Function(_Signup value)? signup,
    TResult? Function(_CheckOTP value)? checkOTP,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckPhone value)? checkPhone,
    TResult Function(_Login value)? login,
    TResult Function(_Signup value)? signup,
    TResult Function(_CheckOTP value)? checkOTP,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthEventCopyWith<$Res> {
  factory $AuthEventCopyWith(AuthEvent value, $Res Function(AuthEvent) then) =
      _$AuthEventCopyWithImpl<$Res, AuthEvent>;
}

/// @nodoc
class _$AuthEventCopyWithImpl<$Res, $Val extends AuthEvent>
    implements $AuthEventCopyWith<$Res> {
  _$AuthEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_CheckPhoneCopyWith<$Res> {
  factory _$$_CheckPhoneCopyWith(
          _$_CheckPhone value, $Res Function(_$_CheckPhone) then) =
      __$$_CheckPhoneCopyWithImpl<$Res>;
  @useResult
  $Res call({String phoneNumber});
}

/// @nodoc
class __$$_CheckPhoneCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$_CheckPhone>
    implements _$$_CheckPhoneCopyWith<$Res> {
  __$$_CheckPhoneCopyWithImpl(
      _$_CheckPhone _value, $Res Function(_$_CheckPhone) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
  }) {
    return _then(_$_CheckPhone(
      null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_CheckPhone implements _CheckPhone {
  const _$_CheckPhone(this.phoneNumber);

  @override
  final String phoneNumber;

  @override
  String toString() {
    return 'AuthEvent.checkPhone(phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CheckPhone &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber));
  }

  @override
  int get hashCode => Object.hash(runtimeType, phoneNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CheckPhoneCopyWith<_$_CheckPhone> get copyWith =>
      __$$_CheckPhoneCopyWithImpl<_$_CheckPhone>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phoneNumber) checkPhone,
    required TResult Function(String phone, String password) login,
    required TResult Function(SignupParameters parameters) signup,
    required TResult Function(String phoneNumber, String code) checkOTP,
  }) {
    return checkPhone(phoneNumber);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phoneNumber)? checkPhone,
    TResult? Function(String phone, String password)? login,
    TResult? Function(SignupParameters parameters)? signup,
    TResult? Function(String phoneNumber, String code)? checkOTP,
  }) {
    return checkPhone?.call(phoneNumber);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneNumber)? checkPhone,
    TResult Function(String phone, String password)? login,
    TResult Function(SignupParameters parameters)? signup,
    TResult Function(String phoneNumber, String code)? checkOTP,
    required TResult orElse(),
  }) {
    if (checkPhone != null) {
      return checkPhone(phoneNumber);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckPhone value) checkPhone,
    required TResult Function(_Login value) login,
    required TResult Function(_Signup value) signup,
    required TResult Function(_CheckOTP value) checkOTP,
  }) {
    return checkPhone(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckPhone value)? checkPhone,
    TResult? Function(_Login value)? login,
    TResult? Function(_Signup value)? signup,
    TResult? Function(_CheckOTP value)? checkOTP,
  }) {
    return checkPhone?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckPhone value)? checkPhone,
    TResult Function(_Login value)? login,
    TResult Function(_Signup value)? signup,
    TResult Function(_CheckOTP value)? checkOTP,
    required TResult orElse(),
  }) {
    if (checkPhone != null) {
      return checkPhone(this);
    }
    return orElse();
  }
}

abstract class _CheckPhone implements AuthEvent {
  const factory _CheckPhone(final String phoneNumber) = _$_CheckPhone;

  String get phoneNumber;
  @JsonKey(ignore: true)
  _$$_CheckPhoneCopyWith<_$_CheckPhone> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LoginCopyWith<$Res> {
  factory _$$_LoginCopyWith(_$_Login value, $Res Function(_$_Login) then) =
      __$$_LoginCopyWithImpl<$Res>;
  @useResult
  $Res call({String phone, String password});
}

/// @nodoc
class __$$_LoginCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$_Login>
    implements _$$_LoginCopyWith<$Res> {
  __$$_LoginCopyWithImpl(_$_Login _value, $Res Function(_$_Login) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phone = null,
    Object? password = null,
  }) {
    return _then(_$_Login(
      null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Login implements _Login {
  const _$_Login(this.phone, this.password);

  @override
  final String phone;
  @override
  final String password;

  @override
  String toString() {
    return 'AuthEvent.login(phone: $phone, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Login &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, phone, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoginCopyWith<_$_Login> get copyWith =>
      __$$_LoginCopyWithImpl<_$_Login>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phoneNumber) checkPhone,
    required TResult Function(String phone, String password) login,
    required TResult Function(SignupParameters parameters) signup,
    required TResult Function(String phoneNumber, String code) checkOTP,
  }) {
    return login(phone, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phoneNumber)? checkPhone,
    TResult? Function(String phone, String password)? login,
    TResult? Function(SignupParameters parameters)? signup,
    TResult? Function(String phoneNumber, String code)? checkOTP,
  }) {
    return login?.call(phone, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneNumber)? checkPhone,
    TResult Function(String phone, String password)? login,
    TResult Function(SignupParameters parameters)? signup,
    TResult Function(String phoneNumber, String code)? checkOTP,
    required TResult orElse(),
  }) {
    if (login != null) {
      return login(phone, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckPhone value) checkPhone,
    required TResult Function(_Login value) login,
    required TResult Function(_Signup value) signup,
    required TResult Function(_CheckOTP value) checkOTP,
  }) {
    return login(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckPhone value)? checkPhone,
    TResult? Function(_Login value)? login,
    TResult? Function(_Signup value)? signup,
    TResult? Function(_CheckOTP value)? checkOTP,
  }) {
    return login?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckPhone value)? checkPhone,
    TResult Function(_Login value)? login,
    TResult Function(_Signup value)? signup,
    TResult Function(_CheckOTP value)? checkOTP,
    required TResult orElse(),
  }) {
    if (login != null) {
      return login(this);
    }
    return orElse();
  }
}

abstract class _Login implements AuthEvent {
  const factory _Login(final String phone, final String password) = _$_Login;

  String get phone;
  String get password;
  @JsonKey(ignore: true)
  _$$_LoginCopyWith<_$_Login> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SignupCopyWith<$Res> {
  factory _$$_SignupCopyWith(_$_Signup value, $Res Function(_$_Signup) then) =
      __$$_SignupCopyWithImpl<$Res>;
  @useResult
  $Res call({SignupParameters parameters});
}

/// @nodoc
class __$$_SignupCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$_Signup>
    implements _$$_SignupCopyWith<$Res> {
  __$$_SignupCopyWithImpl(_$_Signup _value, $Res Function(_$_Signup) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? parameters = null,
  }) {
    return _then(_$_Signup(
      null == parameters
          ? _value.parameters
          : parameters // ignore: cast_nullable_to_non_nullable
              as SignupParameters,
    ));
  }
}

/// @nodoc

class _$_Signup implements _Signup {
  const _$_Signup(this.parameters);

  @override
  final SignupParameters parameters;

  @override
  String toString() {
    return 'AuthEvent.signup(parameters: $parameters)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Signup &&
            (identical(other.parameters, parameters) ||
                other.parameters == parameters));
  }

  @override
  int get hashCode => Object.hash(runtimeType, parameters);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SignupCopyWith<_$_Signup> get copyWith =>
      __$$_SignupCopyWithImpl<_$_Signup>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phoneNumber) checkPhone,
    required TResult Function(String phone, String password) login,
    required TResult Function(SignupParameters parameters) signup,
    required TResult Function(String phoneNumber, String code) checkOTP,
  }) {
    return signup(parameters);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phoneNumber)? checkPhone,
    TResult? Function(String phone, String password)? login,
    TResult? Function(SignupParameters parameters)? signup,
    TResult? Function(String phoneNumber, String code)? checkOTP,
  }) {
    return signup?.call(parameters);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneNumber)? checkPhone,
    TResult Function(String phone, String password)? login,
    TResult Function(SignupParameters parameters)? signup,
    TResult Function(String phoneNumber, String code)? checkOTP,
    required TResult orElse(),
  }) {
    if (signup != null) {
      return signup(parameters);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckPhone value) checkPhone,
    required TResult Function(_Login value) login,
    required TResult Function(_Signup value) signup,
    required TResult Function(_CheckOTP value) checkOTP,
  }) {
    return signup(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckPhone value)? checkPhone,
    TResult? Function(_Login value)? login,
    TResult? Function(_Signup value)? signup,
    TResult? Function(_CheckOTP value)? checkOTP,
  }) {
    return signup?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckPhone value)? checkPhone,
    TResult Function(_Login value)? login,
    TResult Function(_Signup value)? signup,
    TResult Function(_CheckOTP value)? checkOTP,
    required TResult orElse(),
  }) {
    if (signup != null) {
      return signup(this);
    }
    return orElse();
  }
}

abstract class _Signup implements AuthEvent {
  const factory _Signup(final SignupParameters parameters) = _$_Signup;

  SignupParameters get parameters;
  @JsonKey(ignore: true)
  _$$_SignupCopyWith<_$_Signup> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_CheckOTPCopyWith<$Res> {
  factory _$$_CheckOTPCopyWith(
          _$_CheckOTP value, $Res Function(_$_CheckOTP) then) =
      __$$_CheckOTPCopyWithImpl<$Res>;
  @useResult
  $Res call({String phoneNumber, String code});
}

/// @nodoc
class __$$_CheckOTPCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$_CheckOTP>
    implements _$$_CheckOTPCopyWith<$Res> {
  __$$_CheckOTPCopyWithImpl(
      _$_CheckOTP _value, $Res Function(_$_CheckOTP) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
    Object? code = null,
  }) {
    return _then(_$_CheckOTP(
      null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_CheckOTP implements _CheckOTP {
  const _$_CheckOTP(this.phoneNumber, this.code);

  @override
  final String phoneNumber;
  @override
  final String code;

  @override
  String toString() {
    return 'AuthEvent.checkOTP(phoneNumber: $phoneNumber, code: $code)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CheckOTP &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, phoneNumber, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CheckOTPCopyWith<_$_CheckOTP> get copyWith =>
      __$$_CheckOTPCopyWithImpl<_$_CheckOTP>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phoneNumber) checkPhone,
    required TResult Function(String phone, String password) login,
    required TResult Function(SignupParameters parameters) signup,
    required TResult Function(String phoneNumber, String code) checkOTP,
  }) {
    return checkOTP(phoneNumber, code);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phoneNumber)? checkPhone,
    TResult? Function(String phone, String password)? login,
    TResult? Function(SignupParameters parameters)? signup,
    TResult? Function(String phoneNumber, String code)? checkOTP,
  }) {
    return checkOTP?.call(phoneNumber, code);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneNumber)? checkPhone,
    TResult Function(String phone, String password)? login,
    TResult Function(SignupParameters parameters)? signup,
    TResult Function(String phoneNumber, String code)? checkOTP,
    required TResult orElse(),
  }) {
    if (checkOTP != null) {
      return checkOTP(phoneNumber, code);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckPhone value) checkPhone,
    required TResult Function(_Login value) login,
    required TResult Function(_Signup value) signup,
    required TResult Function(_CheckOTP value) checkOTP,
  }) {
    return checkOTP(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckPhone value)? checkPhone,
    TResult? Function(_Login value)? login,
    TResult? Function(_Signup value)? signup,
    TResult? Function(_CheckOTP value)? checkOTP,
  }) {
    return checkOTP?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckPhone value)? checkPhone,
    TResult Function(_Login value)? login,
    TResult Function(_Signup value)? signup,
    TResult Function(_CheckOTP value)? checkOTP,
    required TResult orElse(),
  }) {
    if (checkOTP != null) {
      return checkOTP(this);
    }
    return orElse();
  }
}

abstract class _CheckOTP implements AuthEvent {
  const factory _CheckOTP(final String phoneNumber, final String code) =
      _$_CheckOTP;

  String get phoneNumber;
  String get code;
  @JsonKey(ignore: true)
  _$$_CheckOTPCopyWith<_$_CheckOTP> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AuthState {
  Failure? get error => throw _privateConstructorUsedError;
  bool? get success => throw _privateConstructorUsedError;
  bool? get checkPhoneLoading => throw _privateConstructorUsedError;
  bool? get loginLoading => throw _privateConstructorUsedError;
  bool? get signupLoading => throw _privateConstructorUsedError;
  bool get checkOtpLoading => throw _privateConstructorUsedError;
  bool? get checkOtpSuccess => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthStateCopyWith<AuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
  @useResult
  $Res call(
      {Failure? error,
      bool? success,
      bool? checkPhoneLoading,
      bool? loginLoading,
      bool? signupLoading,
      bool checkOtpLoading,
      bool? checkOtpSuccess});
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
    Object? success = freezed,
    Object? checkPhoneLoading = freezed,
    Object? loginLoading = freezed,
    Object? signupLoading = freezed,
    Object? checkOtpLoading = null,
    Object? checkOtpSuccess = freezed,
  }) {
    return _then(_value.copyWith(
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Failure?,
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
      checkPhoneLoading: freezed == checkPhoneLoading
          ? _value.checkPhoneLoading
          : checkPhoneLoading // ignore: cast_nullable_to_non_nullable
              as bool?,
      loginLoading: freezed == loginLoading
          ? _value.loginLoading
          : loginLoading // ignore: cast_nullable_to_non_nullable
              as bool?,
      signupLoading: freezed == signupLoading
          ? _value.signupLoading
          : signupLoading // ignore: cast_nullable_to_non_nullable
              as bool?,
      checkOtpLoading: null == checkOtpLoading
          ? _value.checkOtpLoading
          : checkOtpLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      checkOtpSuccess: freezed == checkOtpSuccess
          ? _value.checkOtpSuccess
          : checkOtpSuccess // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AuthStateCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$$_AuthStateCopyWith(
          _$_AuthState value, $Res Function(_$_AuthState) then) =
      __$$_AuthStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Failure? error,
      bool? success,
      bool? checkPhoneLoading,
      bool? loginLoading,
      bool? signupLoading,
      bool checkOtpLoading,
      bool? checkOtpSuccess});
}

/// @nodoc
class __$$_AuthStateCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$_AuthState>
    implements _$$_AuthStateCopyWith<$Res> {
  __$$_AuthStateCopyWithImpl(
      _$_AuthState _value, $Res Function(_$_AuthState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
    Object? success = freezed,
    Object? checkPhoneLoading = freezed,
    Object? loginLoading = freezed,
    Object? signupLoading = freezed,
    Object? checkOtpLoading = null,
    Object? checkOtpSuccess = freezed,
  }) {
    return _then(_$_AuthState(
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Failure?,
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
      checkPhoneLoading: freezed == checkPhoneLoading
          ? _value.checkPhoneLoading
          : checkPhoneLoading // ignore: cast_nullable_to_non_nullable
              as bool?,
      loginLoading: freezed == loginLoading
          ? _value.loginLoading
          : loginLoading // ignore: cast_nullable_to_non_nullable
              as bool?,
      signupLoading: freezed == signupLoading
          ? _value.signupLoading
          : signupLoading // ignore: cast_nullable_to_non_nullable
              as bool?,
      checkOtpLoading: null == checkOtpLoading
          ? _value.checkOtpLoading
          : checkOtpLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      checkOtpSuccess: freezed == checkOtpSuccess
          ? _value.checkOtpSuccess
          : checkOtpSuccess // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$_AuthState implements _AuthState {
  const _$_AuthState(
      {this.error,
      this.success,
      this.checkPhoneLoading,
      this.loginLoading,
      this.signupLoading,
      this.checkOtpLoading = false,
      this.checkOtpSuccess});

  @override
  final Failure? error;
  @override
  final bool? success;
  @override
  final bool? checkPhoneLoading;
  @override
  final bool? loginLoading;
  @override
  final bool? signupLoading;
  @override
  @JsonKey()
  final bool checkOtpLoading;
  @override
  final bool? checkOtpSuccess;

  @override
  String toString() {
    return 'AuthState(error: $error, success: $success, checkPhoneLoading: $checkPhoneLoading, loginLoading: $loginLoading, signupLoading: $signupLoading, checkOtpLoading: $checkOtpLoading, checkOtpSuccess: $checkOtpSuccess)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthState &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.checkPhoneLoading, checkPhoneLoading) ||
                other.checkPhoneLoading == checkPhoneLoading) &&
            (identical(other.loginLoading, loginLoading) ||
                other.loginLoading == loginLoading) &&
            (identical(other.signupLoading, signupLoading) ||
                other.signupLoading == signupLoading) &&
            (identical(other.checkOtpLoading, checkOtpLoading) ||
                other.checkOtpLoading == checkOtpLoading) &&
            (identical(other.checkOtpSuccess, checkOtpSuccess) ||
                other.checkOtpSuccess == checkOtpSuccess));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      error,
      success,
      checkPhoneLoading,
      loginLoading,
      signupLoading,
      checkOtpLoading,
      checkOtpSuccess);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthStateCopyWith<_$_AuthState> get copyWith =>
      __$$_AuthStateCopyWithImpl<_$_AuthState>(this, _$identity);
}

abstract class _AuthState implements AuthState {
  const factory _AuthState(
      {final Failure? error,
      final bool? success,
      final bool? checkPhoneLoading,
      final bool? loginLoading,
      final bool? signupLoading,
      final bool checkOtpLoading,
      final bool? checkOtpSuccess}) = _$_AuthState;

  @override
  Failure? get error;
  @override
  bool? get success;
  @override
  bool? get checkPhoneLoading;
  @override
  bool? get loginLoading;
  @override
  bool? get signupLoading;
  @override
  bool get checkOtpLoading;
  @override
  bool? get checkOtpSuccess;
  @override
  @JsonKey(ignore: true)
  _$$_AuthStateCopyWith<_$_AuthState> get copyWith =>
      throw _privateConstructorUsedError;
}
