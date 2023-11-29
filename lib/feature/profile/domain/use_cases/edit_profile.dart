import 'package:dartz/dartz.dart';
import 'package:nesma/core/failure/failure.dart';
import 'package:nesma/core/network/api/api.dart';
import 'package:nesma/features/profile/data/parameters/parameters.dart';
import 'package:nesma/features/profile/domain/repositories/profile_domain_repository.dart';

class EditProfileUseCase {
  final ProfileDomainRepository repository;

  EditProfileUseCase(this.repository);

  Future<Either<Failure, void>> call({
    required EditProfileParameters parameters,
    MediaOption? mediaOption,
  }) =>
      repository.editProfile(
        parameters: parameters,
        mediaOption: mediaOption,
      );
}
