import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:portfolio/common/exceptions/exception.dart';
import 'package:portfolio/common/failures/failures.dart';
import 'package:portfolio/di/di.dart';
import 'package:portfolio/features/welcomeCard/data/datasources/aboutme_datasource.dart';
import 'package:portfolio/features/welcomeCard/domain/entities/aboume_entity.dart';
import 'package:portfolio/features/welcomeCard/domain/repositories/welcome.repo.dart';

@Injectable(as: AboutMeDomainRepo)
class AboutMeDomainRepoImpl implements AboutMeDomainRepo {
  @override
  Future<Either<Failure, List<AboutMeEntity>>> getAboutMeData() async {
    try {
      final result = await getIt<AboutMe>().getAboutData();
      return right(result);
    } on ServerException catch (_) {
      return left(ServerFailure());
    } catch (e) {
      return left(GeneralFailure());
    }
  }
}
