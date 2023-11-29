part of 'spending_manager_bloc.dart';

@freezed
class SpendingManagerEvent with _$SpendingManagerEvent {
  const factory SpendingManagerEvent.getTotalSpending() = _GetTotalSpending;

  const factory SpendingManagerEvent.getMonthlySpending() = _GetMonthlySpending;
}
