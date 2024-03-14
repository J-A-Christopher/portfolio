import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:portfolio/common/failures/failures.dart';
import 'package:portfolio/di/di.dart';
import 'package:portfolio/features/news/domain/entities/news_entity.dart';
import 'package:portfolio/features/news/domain/repository/news_repository.dart';

@injectable
class NewsUseCases {
  Future<Either<Failure, List<NewsEntity>>> newsUseCases() async {
    final dataRepo = getIt<NewsDomainRepository>();
    final result =await dataRepo.getNewsDomainRepository();
    return result;
  }
}
