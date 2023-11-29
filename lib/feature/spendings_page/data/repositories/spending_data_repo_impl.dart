import 'package:dartz/dartz.dart';
import 'package:nesma/core/extension/exception_extension.dart';
import 'package:nesma/core/failure/failure.dart';
import 'package:nesma/features/spendings_page/data/data_sources/spending_remote_data_source.dart';
import 'package:nesma/features/spendings_page/domain/entities/spending_entity.dart';
import 'package:nesma/features/spendings_page/domain/repositories/spending_domain_repo.dart';

class SpendingDataRepository implements SpendingDomainRepository {
  final SpendingRemoteDataSource remoteDataSource;

  const SpendingDataRepository({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, List<SpendingEntity>>> getTotalSpending() async {
    try {
      final result = await remoteDataSource.getTotalSpending();
      return Right(result);
    } on Exception catch (e) {
      return Left(e.toFailure);
    }
  }

  @override
  Future<Either<Failure, Map<DateTime, List<SpendingEntity>>>>
      getMonthlySpending() async {
    try {
      final result = await remoteDataSource.getMonthlySpending();
      return Right(result);
    } on Exception catch (e) {
      return Left(e.toFailure);
    }
  }
}
