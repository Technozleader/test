import 'package:dartz/dartz.dart';
import 'package:nesma/core/failure/failure.dart';
import 'package:nesma/features/profile/domain/entities/faq_entity.dart';
import 'package:nesma/features/profile/domain/repositories/profile_domain_repository.dart';

class GetFAQsUseCase {
  final ProfileDomainRepository repository;

  GetFAQsUseCase(this.repository);

  Future<Either<Failure, List<FAQEntity>>> call() => repository.getFAQs();
}
