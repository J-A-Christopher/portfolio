import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:portfolio/common/exceptions/exception.dart';
import 'package:portfolio/common/failures/failures.dart';
import 'package:portfolio/di/di.dart';
import 'package:portfolio/features/notifications/data/datasource/image_ds.dart';
import 'package:portfolio/features/notifications/domain/entity/image_ent.dart';
import 'package:portfolio/features/notifications/domain/repository/image_dom_repo.dart';

@Injectable(as: DomainImageRepo)
class ImageRepoDatImpl implements DomainImageRepo {
  @override
  Future<Either<Failure, OfficePictureEntity>> getImageNotf() async {
    try {
      final imageDataSource = getIt<GetImageString>();
      final retrievedImage = await imageDataSource.getImage();
      return right(retrievedImage);
    } on ServerException catch (_) {
      return left(ServerFailure());
    } catch (e) {
      return left(GeneralFailure());
    }
  }
}
