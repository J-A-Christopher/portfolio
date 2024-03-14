import 'package:dartz/dartz.dart';
import 'package:portfolio/common/failures/failures.dart';
import 'package:portfolio/features/services/domain/entity/service_entity.dart';

abstract class ServiceRepos {
   Future<Either<Failure, List<ServicesEntity>>> getServices();
}