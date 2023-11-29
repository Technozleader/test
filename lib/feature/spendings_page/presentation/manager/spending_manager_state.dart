part of 'spending_manager_bloc.dart';

@freezed
class SpendingManagerState with _$SpendingManagerState {
  const factory SpendingManagerState({
    @Default([]) List<SpendingEntity> spending,
    @Default({}) Map<DateTime, List<SpendingEntity>> monthlySpending,
    @Default(false) bool isLoading,
    @Default(false) bool monthlySpendingLoading,
    Failure? failure,
  }) = _SpendingState;
}
