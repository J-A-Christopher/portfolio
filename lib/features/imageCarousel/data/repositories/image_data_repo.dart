import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:portfolio/di/di.dart';
import 'package:portfolio/features/imageCarousel/data/datasources/image_carousel_datasource.dart';
import 'package:portfolio/features/imageCarousel/domain/entities/image_domain_entity.dart';
import 'package:portfolio/common/failures/failures.dart';
import 'package:portfolio/features/imageCarousel/domain/repository/image_domain_repo.dart';
import 'package:portfolio/common/exceptions/exception.dart';

@Injectable(as: ImageRepo)
class ImageRepoImpl implements ImageRepo {
  @override
  Future<Either<Failure, List<CarouselImageEntity>>>
      getCarouselDomainRepo() async {
    try {
      final imageData = await getIt<ImageDataSource>().getCarouselData();
      return right(imageData);
    } on ServerException catch (_) {
      return left(ServerFailure());
    } catch (e) {
      print('me${e.toString()}');
      return left(GeneralFailure());
    }
  }
}
