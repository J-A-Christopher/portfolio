import 'package:dartz/dartz.dart';
import 'package:portfolio/common/failures/failures.dart';
import 'package:portfolio/features/blogs/domain/entities/blog_entity.dart';

abstract class DomainRepository{
  Future<Either<Failure, List<BlogEntity>>>  blogDomainRepository();

}