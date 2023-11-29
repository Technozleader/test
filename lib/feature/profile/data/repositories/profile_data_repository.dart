import 'package:dartz/dartz.dart';
import 'package:nesma/core/common/entities/user/User_global.dart';
import 'package:nesma/core/extension/exception_extension.dart';
import 'package:nesma/core/failure/failure.dart';
import 'package:nesma/core/network/api/api.dart';
import 'package:nesma/features/account/data/data_sources/auth_local_data_source.dart';
import 'package:nesma/features/profile/data/data_sources/profile_remote_data_source.dart';
import 'package:nesma/features/profile/data/parameters/parameters.dart';
import 'package:nesma/features/profile/domain/entities/faq_entity.dart';
import 'package:nesma/features/profile/domain/entities/static_page.dart';
import 'package:nesma/features/profile/domain/repositories/profile_domain_repository.dart';

class ProfileDataRepository implements ProfileDomainRepository {
  final ProfileRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;

  const ProfileDataRepository({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, void>> editProfile({
    required EditProfileParameters parameters,
    MediaOption? mediaOption,
  }) async {
    try {
      final newUser = await remoteDataSource.editProfile(
        editProfileParameters: parameters,
        mediaOptions: mediaOption,
      );
      User.instance.userEntity = newUser;
      await localDataSource.cashUser(newUser);
      return const Right(null);
    } on Exception catch (e) {
      return Left(e.toFailure);
    }
  }

  @override
  Future<Either<Failure, List<FAQEntity>>> getFAQs() async {
    try {
      final faqs = await remoteDataSource.getFAQs();
      return Right(faqs);
    } on Exception catch (e) {
      return Left(e.toFailure);
    }
  }

  @override
  Future<Either<Failure, Map<String, List<StaticPageEntity>>>>
      getStaticPages() async {
    try {
      final staticPages = await remoteDataSource.getStaticPages();
      return Right(staticPages);
    } on Exception catch (e) {
      return Left(e.toFailure);
    }
  }
}
