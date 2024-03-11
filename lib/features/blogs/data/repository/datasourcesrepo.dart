import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:portfolio/common/exceptions/exception.dart';
import 'package:portfolio/common/failures/failures.dart';
import 'package:portfolio/di/di.dart';
import 'package:portfolio/features/blogs/data/datasources/blog_datasource.dart';
import 'package:portfolio/features/blogs/domain/entities/blog_entity.dart';
import 'package:portfolio/features/blogs/domain/repositories/domain_repository.dart';

@Injectable(as: DomainRepository)
class BlogSourceImpl implements DomainRepository {
  @override
  Future<Either<Failure, List<BlogEntity>>> blogDomainRepository() async {
    try {
      final dataSource = getIt<BlogDataSource>();
      final endResult = await dataSource.getBlogs();
      return right(endResult);
    } on ServerException catch (_) {
      return left(ServerFailure());
    } catch (e) {
      return left(GeneralFailure());
    }
  }
}
