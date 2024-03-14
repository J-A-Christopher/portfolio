import 'package:dartz/dartz.dart';
import 'package:portfolio/common/failures/failures.dart';
import 'package:portfolio/features/whatsnew/domain/entity/whatsnew_entity.dart';

abstract class RepoWhatsNew {
  Future<Either<Failure, List<WhatsNewEntity>>> getWhatsNew();
}
