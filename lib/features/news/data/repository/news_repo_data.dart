import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:portfolio/common/exceptions/exception.dart';
import 'package:portfolio/common/failures/failures.dart';
import 'package:portfolio/di/di.dart';
import 'package:portfolio/features/news/data/datasources/news_datasource.dart';
import 'package:portfolio/features/news/domain/entities/news_entity.dart';
import 'package:portfolio/features/news/domain/repository/news_repository.dart';

@Injectable(as: NewsDomainRepository)
class NewsDomainRepositoryImpl implements NewsDomainRepository {
  @override
  Future<Either<Failure, List<NewsEntity>>> getNewsDomainRepository() async {
    try {
      final dataSource = getIt<NewsDataSource>();
      final endResult = await dataSource.getNewsData();
      return right(endResult);
    } on ServerException catch (_) {
      return left(ServerFailure());
    } catch (e) {
      return left(GeneralFailure());
    }
  }
}
