import 'package:dartz/dartz.dart';
import 'package:nesma/core/failure/failure.dart';
import 'package:nesma/features/spendings_page/domain/entities/spending_entity.dart';

abstract class SpendingDomainRepository {
  Future<Either<Failure, List<SpendingEntity>>> getTotalSpending();

  Future<Either<Failure, Map<DateTime, List<SpendingEntity>>>>
      getMonthlySpending();
}
