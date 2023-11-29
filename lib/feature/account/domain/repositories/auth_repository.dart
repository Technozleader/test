import 'package:dartz/dartz.dart';
import 'package:nesma/core/common/entities/user/user_entity.dart';
import 'package:nesma/core/failure/failure.dart';
import 'package:nesma/features/account/parameters/signup_parameters.dart';

abstract class AuthRepository {
  Future<Either<Failure, bool>> checkPhone(String phone);

  Future<Either<Failure, UserEntity>> login(String phone, String password);

  Future<Either<Failure, UserEntity>> signup(SignupParameters parameters);

  Future<Either<Failure, void>> logout();

  Future<Either<Failure, void>> deactivateAccount();

  Future<Either<Failure, bool>> checkOTP(String phoneNumber, String code);
}
