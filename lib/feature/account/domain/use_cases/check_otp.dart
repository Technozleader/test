import 'package:dartz/dartz.dart';
import 'package:nesma/core/failure/failure.dart';
import 'package:nesma/features/account/domain/repositories/auth_repository.dart';

class CheckOTPUseCase {
  final AuthRepository repository;

  CheckOTPUseCase(this.repository);

  Future<Either<Failure, bool>> call({
    required String phoneNumber,
    required String code,
  }) =>
      repository.checkOTP(phoneNumber, code);
}
