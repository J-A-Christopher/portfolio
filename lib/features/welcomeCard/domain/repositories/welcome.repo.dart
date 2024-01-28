import 'package:dartz/dartz.dart';
import 'package:portfolio/common/failures/failures.dart';
import 'package:portfolio/features/welcomeCard/domain/entities/aboume_entity.dart';

abstract class AboutMeDomainRepo {
  Future<Either<Failure, List<AboutMeEntity>>> getAboutMeData();
}
