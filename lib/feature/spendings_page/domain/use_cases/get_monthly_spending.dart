import 'package:dartz/dartz.dart';
import 'package:nesma/core/failure/failure.dart';
import 'package:nesma/features/spendings_page/domain/entities/spending_entity.dart';
import 'package:nesma/features/spendings_page/domain/repositories/spending_domain_repo.dart';

class GetMonthlySpendingUseCase {
  final SpendingDomainRepository repository;

  GetMonthlySpendingUseCase(this.repository);

  Future<Either<Failure, Map<DateTime, List<SpendingEntity>>>> call() =>
      repository.getMonthlySpending();
}
