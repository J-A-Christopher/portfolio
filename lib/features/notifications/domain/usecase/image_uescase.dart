
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:portfolio/common/failures/failures.dart';
import 'package:portfolio/di/di.dart';
import 'package:portfolio/features/notifications/domain/entity/image_ent.dart';
import 'package:portfolio/features/notifications/domain/repository/image_dom_repo.dart';

@injectable
class ImageCases {
  Future<Either<Failure, OfficePictureEntity>> imageUseCases() async {
    final imageRepo = getIt<DomainImageRepo>();
    final result = imageRepo.getImageNotf();
    return result;
  }
}