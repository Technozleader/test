import 'package:dartz/dartz.dart';
import 'package:nesma/core/common/entities/user/user_entity.dart';
import 'package:nesma/core/failure/failure.dart';
import 'package:nesma/features/account/domain/repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<Either<Failure, UserEntity>> call(
          String email, String password) async =>
      await repository.login(email, password);
}
