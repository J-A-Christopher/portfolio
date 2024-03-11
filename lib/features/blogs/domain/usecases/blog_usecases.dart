import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:portfolio/common/failures/failures.dart';
import 'package:portfolio/di/di.dart';
import 'package:portfolio/features/blogs/domain/entities/blog_entity.dart';
import 'package:portfolio/features/blogs/domain/repositories/domain_repository.dart';

@injectable
class BlogUseCases {
  Future<Either<Failure, List<BlogEntity>>> blogUseCases() async {
    final dataRepo = getIt<DomainRepository>();
    final result = dataRepo.blogDomainRepository();
    return result;
  }
}
