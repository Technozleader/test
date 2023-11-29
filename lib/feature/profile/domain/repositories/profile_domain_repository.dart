import 'package:dartz/dartz.dart';
import 'package:nesma/core/failure/failure.dart';
import 'package:nesma/core/network/api/api.dart';
import 'package:nesma/features/profile/data/parameters/parameters.dart';
import 'package:nesma/features/profile/domain/entities/faq_entity.dart';
import 'package:nesma/features/profile/domain/entities/static_page.dart';

abstract class ProfileDomainRepository {
  Future<Either<Failure, void>> editProfile({
    required EditProfileParameters parameters,
    MediaOption? mediaOption,
  });

  Future<Either<Failure, List<FAQEntity>>> getFAQs();

  Future<Either<Failure, Map<String, List<StaticPageEntity>>>> getStaticPages();
}
