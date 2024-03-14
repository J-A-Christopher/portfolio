import 'package:dartz/dartz.dart';
import 'package:portfolio/common/failures/failures.dart';
import 'package:portfolio/features/notifications/domain/entity/image_ent.dart';

abstract class DomainImageRepo {
  Future<Either<Failure, OfficePictureEntity>> getImageNotf();
}
