// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'spending_manager_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SpendingManagerEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getTotalSpending,
    required TResult Function() getMonthlySpending,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getTotalSpending,
    TResult? Function()? getMonthlySpending,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getTotalSpending,
    TResult Function()? getMonthlySpending,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetTotalSpending value) getTotalSpending,
    required TResult Function(_GetMonthlySpending value) getMonthlySpending,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetTotalSpending value)? getTotalSpending,
    TResult? Function(_GetMonthlySpending value)? getMonthlySpending,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetTotalSpending value)? getTotalSpending,
    TResult Function(_GetMonthlySpending value)? getMonthlySpending,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpendingManagerEventCopyWith<$Res> {
  factory $SpendingManagerEventCopyWith(SpendingManagerEvent value,
          $Res Function(SpendingManagerEvent) then) =
      _$SpendingManagerEventCopyWithImpl<$Res, SpendingManagerEvent>;
}

/// @nodoc
class _$SpendingManagerEventCopyWithImpl<$Res,
        $Val extends SpendingManagerEvent>
    implements $SpendingManagerEventCopyWith<$Res> {
  _$SpendingManagerEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_GetTotalSpendingCopyWith<$Res> {
  factory _$$_GetTotalSpendingCopyWith(
          _$_GetTotalSpending value, $Res Function(_$_GetTotalSpending) then) =
      __$$_GetTotalSpendingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_GetTotalSpendingCopyWithImpl<$Res>
    extends _$SpendingManagerEventCopyWithImpl<$Res, _$_GetTotalSpending>
    implements _$$_GetTotalSpendingCopyWith<$Res> {
  __$$_GetTotalSpendingCopyWithImpl(
      _$_GetTotalSpending _value, $Res Function(_$_GetTotalSpending) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_GetTotalSpending implements _GetTotalSpending {
  const _$_GetTotalSpending();

  @override
  String toString() {
    return 'SpendingManagerEvent.getTotalSpending()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_GetTotalSpending);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getTotalSpending,
    required TResult Function() getMonthlySpending,
  }) {
    return getTotalSpending();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getTotalSpending,
    TResult? Function()? getMonthlySpending,
  }) {
    return getTotalSpending?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getTotalSpending,
    TResult Function()? getMonthlySpending,
    required TResult orElse(),
  }) {
    if (getTotalSpending != null) {
      return getTotalSpending();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetTotalSpending value) getTotalSpending,
    required TResult Function(_GetMonthlySpending value) getMonthlySpending,
  }) {
    return getTotalSpending(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetTotalSpending value)? getTotalSpending,
    TResult? Function(_GetMonthlySpending value)? getMonthlySpending,
  }) {
    return getTotalSpending?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetTotalSpending value)? getTotalSpending,
    TResult Function(_GetMonthlySpending value)? getMonthlySpending,
    required TResult orElse(),
  }) {
    if (getTotalSpending != null) {
      return getTotalSpending(this);
    }
    return orElse();
  }
}

abstract class _GetTotalSpending implements SpendingManagerEvent {
  const factory _GetTotalSpending() = _$_GetTotalSpending;
}

/// @nodoc
abstract class _$$_GetMonthlySpendingCopyWith<$Res> {
  factory _$$_GetMonthlySpendingCopyWith(_$_GetMonthlySpending value,
          $Res Function(_$_GetMonthlySpending) then) =
      __$$_GetMonthlySpendingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_GetMonthlySpendingCopyWithImpl<$Res>
    extends _$SpendingManagerEventCopyWithImpl<$Res, _$_GetMonthlySpending>
    implements _$$_GetMonthlySpendingCopyWith<$Res> {
  __$$_GetMonthlySpendingCopyWithImpl(
      _$_GetMonthlySpending _value, $Res Function(_$_GetMonthlySpending) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_GetMonthlySpending implements _GetMonthlySpending {
  const _$_GetMonthlySpending();

  @override
  String toString() {
    return 'SpendingManagerEvent.getMonthlySpending()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_GetMonthlySpending);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getTotalSpending,
    required TResult Function() getMonthlySpending,
  }) {
    return getMonthlySpending();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getTotalSpending,
    TResult? Function()? getMonthlySpending,
  }) {
    return getMonthlySpending?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getTotalSpending,
    TResult Function()? getMonthlySpending,
    required TResult orElse(),
  }) {
    if (getMonthlySpending != null) {
      return getMonthlySpending();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetTotalSpending value) getTotalSpending,
    required TResult Function(_GetMonthlySpending value) getMonthlySpending,
  }) {
    return getMonthlySpending(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetTotalSpending value)? getTotalSpending,
    TResult? Function(_GetMonthlySpending value)? getMonthlySpending,
  }) {
    return getMonthlySpending?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetTotalSpending value)? getTotalSpending,
    TResult Function(_GetMonthlySpending value)? getMonthlySpending,
    required TResult orElse(),
  }) {
    if (getMonthlySpending != null) {
      return getMonthlySpending(this);
    }
    return orElse();
  }
}

abstract class _GetMonthlySpending implements SpendingManagerEvent {
  const factory _GetMonthlySpending() = _$_GetMonthlySpending;
}

/// @nodoc
mixin _$SpendingManagerState {
  List<SpendingEntity> get spending => throw _privateConstructorUsedError;
  Map<DateTime, List<SpendingEntity>> get monthlySpending =>
      throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get monthlySpendingLoading => throw _privateConstructorUsedError;
  Failure? get failure => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SpendingManagerStateCopyWith<SpendingManagerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpendingManagerStateCopyWith<$Res> {
  factory $SpendingManagerStateCopyWith(SpendingManagerState value,
          $Res Function(SpendingManagerState) then) =
      _$SpendingManagerStateCopyWithImpl<$Res, SpendingManagerState>;
  @useResult
  $Res call(
      {List<SpendingEntity> spending,
      Map<DateTime, List<SpendingEntity>> monthlySpending,
      bool isLoading,
      bool monthlySpendingLoading,
      Failure? failure});
}

/// @nodoc
class _$SpendingManagerStateCopyWithImpl<$Res,
        $Val extends SpendingManagerState>
    implements $SpendingManagerStateCopyWith<$Res> {
  _$SpendingManagerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? spending = null,
    Object? monthlySpending = null,
    Object? isLoading = null,
    Object? monthlySpendingLoading = null,
    Object? failure = freezed,
  }) {
    return _then(_value.copyWith(
      spending: null == spending
          ? _value.spending
          : spending // ignore: cast_nullable_to_non_nullable
              as List<SpendingEntity>,
      monthlySpending: null == monthlySpending
          ? _value.monthlySpending
          : monthlySpending // ignore: cast_nullable_to_non_nullable
              as Map<DateTime, List<SpendingEntity>>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      monthlySpendingLoading: null == monthlySpendingLoading
          ? _value.monthlySpendingLoading
          : monthlySpendingLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      failure: freezed == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SpendingStateCopyWith<$Res>
    implements $SpendingManagerStateCopyWith<$Res> {
  factory _$$_SpendingStateCopyWith(
          _$_SpendingState value, $Res Function(_$_SpendingState) then) =
      __$$_SpendingStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<SpendingEntity> spending,
      Map<DateTime, List<SpendingEntity>> monthlySpending,
      bool isLoading,
      bool monthlySpendingLoading,
      Failure? failure});
}

/// @nodoc
class __$$_SpendingStateCopyWithImpl<$Res>
    extends _$SpendingManagerStateCopyWithImpl<$Res, _$_SpendingState>
    implements _$$_SpendingStateCopyWith<$Res> {
  __$$_SpendingStateCopyWithImpl(
      _$_SpendingState _value, $Res Function(_$_SpendingState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? spending = null,
    Object? monthlySpending = null,
    Object? isLoading = null,
    Object? monthlySpendingLoading = null,
    Object? failure = freezed,
  }) {
    return _then(_$_SpendingState(
      spending: null == spending
          ? _value._spending
          : spending // ignore: cast_nullable_to_non_nullable
              as List<SpendingEntity>,
      monthlySpending: null == monthlySpending
          ? _value._monthlySpending
          : monthlySpending // ignore: cast_nullable_to_non_nullable
              as Map<DateTime, List<SpendingEntity>>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      monthlySpendingLoading: null == monthlySpendingLoading
          ? _value.monthlySpendingLoading
          : monthlySpendingLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      failure: freezed == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
    ));
  }
}

/// @nodoc

class _$_SpendingState implements _SpendingState {
  const _$_SpendingState(
      {final List<SpendingEntity> spending = const [],
      final Map<DateTime, List<SpendingEntity>> monthlySpending = const {},
      this.isLoading = false,
      this.monthlySpendingLoading = false,
      this.failure})
      : _spending = spending,
        _monthlySpending = monthlySpending;

  final List<SpendingEntity> _spending;
  @override
  @JsonKey()
  List<SpendingEntity> get spending {
    if (_spending is EqualUnmodifiableListView) return _spending;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_spending);
  }

  final Map<DateTime, List<SpendingEntity>> _monthlySpending;
  @override
  @JsonKey()
  Map<DateTime, List<SpendingEntity>> get monthlySpending {
    if (_monthlySpending is EqualUnmodifiableMapView) return _monthlySpending;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_monthlySpending);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool monthlySpendingLoading;
  @override
  final Failure? failure;

  @override
  String toString() {
    return 'SpendingManagerState(spending: $spending, monthlySpending: $monthlySpending, isLoading: $isLoading, monthlySpendingLoading: $monthlySpendingLoading, failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SpendingState &&
            const DeepCollectionEquality().equals(other._spending, _spending) &&
            const DeepCollectionEquality()
                .equals(other._monthlySpending, _monthlySpending) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.monthlySpendingLoading, monthlySpendingLoading) ||
                other.monthlySpendingLoading == monthlySpendingLoading) &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_spending),
      const DeepCollectionEquality().hash(_monthlySpending),
      isLoading,
      monthlySpendingLoading,
      failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SpendingStateCopyWith<_$_SpendingState> get copyWith =>
      __$$_SpendingStateCopyWithImpl<_$_SpendingState>(this, _$identity);
}

abstract class _SpendingState implements SpendingManagerState {
  const factory _SpendingState(
      {final List<SpendingEntity> spending,
      final Map<DateTime, List<SpendingEntity>> monthlySpending,
      final bool isLoading,
      final bool monthlySpendingLoading,
      final Failure? failure}) = _$_SpendingState;

  @override
  List<SpendingEntity> get spending;
  @override
  Map<DateTime, List<SpendingEntity>> get monthlySpending;
  @override
  bool get isLoading;
  @override
  bool get monthlySpendingLoading;
  @override
  Failure? get failure;
  @override
  @JsonKey(ignore: true)
  _$$_SpendingStateCopyWith<_$_SpendingState> get copyWith =>
      throw _privateConstructorUsedError;
}
