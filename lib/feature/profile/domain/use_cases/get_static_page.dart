import 'package:dartz/dartz.dart';
import 'package:nesma/core/failure/failure.dart';
import 'package:nesma/features/profile/domain/entities/static_page.dart';
import 'package:nesma/features/profile/domain/repositories/profile_domain_repository.dart';

class GetStaticPageUseCase {
  final ProfileDomainRepository repository;

  GetStaticPageUseCase(this.repository);

  Future<Either<Failure, Map<String, List<StaticPageEntity>>>> call() =>
      repository.getStaticPages();
}
