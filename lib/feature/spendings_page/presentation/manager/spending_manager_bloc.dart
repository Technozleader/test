import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:nesma/core/failure/failure.dart';
import 'package:nesma/features/spendings_page/domain/entities/spending_entity.dart';
import 'package:nesma/features/spendings_page/domain/use_cases/get_monthly_spending.dart';
import 'package:nesma/features/spendings_page/domain/use_cases/get_total_spending.dart';

part 'spending_manager_event.dart';

part 'spending_manager_state.dart';

part 'spending_manager_bloc.freezed.dart';

class SpendingManagerBloc
    extends Bloc<SpendingManagerEvent, SpendingManagerState> {
  final GetTotalSpendingUseCase getTotalSpendingUseCase;
  final GetMonthlySpendingUseCase getMonthlySpendingUseCase;

  SpendingManagerBloc({
    required this.getTotalSpendingUseCase,
    required this.getMonthlySpendingUseCase,
  }) : super(const SpendingManagerState()) {
    on<SpendingManagerEvent>((event, emit) async {
      switch (event.runtimeType) {
        case _$_GetTotalSpending:
          await _getTotalSpending(event, emit);
          break;
        case _$_GetMonthlySpending:
          await _getMonthlySpending(event, emit);
          break;
      }
    });
  }

  Future<void> _getTotalSpending(
      SpendingManagerEvent event, Emitter<SpendingManagerState> emit) async {
    event as _$_GetTotalSpending;
    emit(state.copyWith(
      isLoading: true,
    ));
    final result = await getTotalSpendingUseCase();
    result.fold(
      (failure) => emit(
        state.copyWith(
          isLoading: false,
          failure: failure,
        ),
      ),
      (totalSpending) => emit(
        state.copyWith(
          isLoading: false,
          spending: totalSpending,
        ),
      ),
    );
  }

  double calculateTotalSpending() {
    if (state.spending.isEmpty) return 0.0;
    return state.spending
        .map((e) => e.total)
        .reduce((value, element) => value + element);
  }

  String get calculateFirstDate {
    if (state.monthlySpending.isEmpty) return '';
    final date = state.monthlySpending.keys.last;
    return DateFormat().add_MMMd().format(date);
  }

  Future<void> _getMonthlySpending(
      SpendingManagerEvent event, Emitter<SpendingManagerState> emit) async {
    event as _$_GetMonthlySpending;
    emit(state.copyWith(
      monthlySpendingLoading: true,
    ));
    final result = await getMonthlySpendingUseCase();
    result.fold(
      (failure) => emit(
        state.copyWith(
          monthlySpendingLoading: false,
          failure: failure,
        ),
      ),
      (monthlySpending) => emit(
        state.copyWith(
          monthlySpendingLoading: false,
          monthlySpending: monthlySpending,
        ),
      ),
    );
  }
}
