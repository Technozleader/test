import 'package:dartz/dartz.dart';
import 'package:nesma/core/failure/failure.dart';
import 'package:nesma/features/account/domain/repositories/auth_repository.dart';

class LogoutUseCase {
  final AuthRepository repository;

  LogoutUseCase(this.repository);

  Future<Either<Failure, void>> call() => repository.logout();
}
