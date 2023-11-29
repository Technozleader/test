import 'package:dartz/dartz.dart';
import 'package:nesma/core/common/entities/user/user_entity.dart';
import 'package:nesma/core/failure/failure.dart';
import 'package:nesma/features/account/domain/repositories/auth_repository.dart';
import 'package:nesma/features/account/parameters/signup_parameters.dart';

class SignupUseCase {
  final AuthRepository repository;

  SignupUseCase(this.repository);

  Future<Either<Failure, UserEntity>> call(SignupParameters parameters) async =>
      await repository.signup(parameters);
}
