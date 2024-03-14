import 'package:dartz/dartz.dart';
import 'package:portfolio/common/failures/failures.dart';
import 'package:portfolio/features/news/domain/entities/news_entity.dart';

abstract class NewsDomainRepository{
   Future<Either<Failure, List<NewsEntity>>>  getNewsDomainRepository();
}