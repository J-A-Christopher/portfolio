import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:portfolio/di/di.dart';
import 'package:portfolio/features/imageCarousel/domain/entities/image_domain_entity.dart';
import 'package:portfolio/features/imageCarousel/domain/failures/failures.dart';
import 'package:portfolio/features/imageCarousel/domain/repository/image_domain_repo.dart';

@injectable
class ImageDataUsesCase {
  Future<Either<Failure, List<CarouselImageEntity>>> getImageUseCase() async {
    final result = await getIt<ImageRepo>().getCarouselDomainRepo();
    return result;
  }
}
