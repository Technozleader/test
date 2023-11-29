//this is use case fro deactivate account that we create in the last moment
import 'package:dartz/dartz.dart';
import 'package:nesma/core/failure/failure.dart';
import 'package:nesma/features/account/domain/repositories/auth_repository.dart';

class DeactivateAccountUseCase {
  final AuthRepository repository;

  DeactivateAccountUseCase(this.repository);

  Future<Either<Failure, void>> call() =>
      repository.deactivateAccount();
}
