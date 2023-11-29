import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:nesma/core/common/entities/user/User_global.dart';
import 'package:nesma/core/common/entities/user/user_entity.dart';
import 'package:nesma/core/extension/exception_extension.dart';
import 'package:nesma/core/failure/failure.dart';
import 'package:nesma/features/account/data/data_sources/auth_local_data_source.dart';
import 'package:nesma/features/account/domain/repositories/auth_repository.dart';
import 'package:nesma/features/account/data/data_sources/auth_remote_data_source.dart';
import 'package:nesma/features/account/parameters/signup_parameters.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, bool>> checkPhone(String phone) async {
    try {
      final result = await remoteDataSource.checkPhone(phone);
      return Right(result);
    } on Exception catch (e) {
      return Left(e.toFailure);
    }
  }

  @override
  Future<Either<Failure, UserEntity>> login(
      String phone, String password) async {
    try {
      final result = await remoteDataSource.login(phone, password);
      User.instance.userEntity = result;
      await localDataSource.cashUser(result);
      return Right(result);
    } on Exception catch (e) {
      return Left(e.toFailure);
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signup(
      SignupParameters parameters) async {
    try {
      final user = await remoteDataSource.signup(parameters);
      return Right(user);
    } on Exception catch (e) {
      return Left(e.toFailure);
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await remoteDataSource.logout();
      await localDataSource.removeUser();
      return const Right(null);
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        return const Right(null);
      } else {
        return Left(e.toFailure);
      }
    } on Exception catch (e) {
      return Left(e.toFailure);
    }
  }

  @override
  Future<Either<Failure, void>> deactivateAccount() async {
    try {
      await remoteDataSource.deactivateAccount();
      return const Right(null);
    } on Exception catch (e) {
      return Left(e.toFailure);
    }
  }

  @override
  Future<Either<Failure, bool>> checkOTP(
      String phoneNumber, String code) async {
    try {
      final result =
          await remoteDataSource.checkOTP(phoneNumber: phoneNumber, otp: code);
      return Right(result);
    } on Exception catch (e) {
      return Left(e.toFailure);
    }
  }
}
