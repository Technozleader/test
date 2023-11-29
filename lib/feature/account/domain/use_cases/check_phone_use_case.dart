import 'package:dartz/dartz.dart';
import 'package:nesma/core/failure/failure.dart';
import 'package:nesma/features/account/domain/repositories/auth_repository.dart';

class CheckPhoneUseCase {
  final AuthRepository repository;

  CheckPhoneUseCase(this.repository);

  Future<Either<Failure, bool>> call(String phone) async =>
      repository.checkPhone(phone);
}
