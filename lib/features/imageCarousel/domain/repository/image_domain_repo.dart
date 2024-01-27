import 'package:dartz/dartz.dart';
import 'package:portfolio/features/imageCarousel/domain/entities/image_domain_entity.dart';
import 'package:portfolio/features/imageCarousel/domain/failures/failures.dart';

abstract class ImageRepo {
  Future<Either<Failure, List<CarouselImageEntity>>> getCarouselDomainRepo();
}
