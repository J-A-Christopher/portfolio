import 'package:dartz/dartz.dart';
import 'package:portfolio/common/failures/failures.dart';
import 'package:portfolio/features/welcomeCard/data/repository/aboutme_data_repo.dart';
import 'package:portfolio/features/welcomeCard/domain/entities/aboume_entity.dart';

class WelcomeUseCase {
  Future<Either<Failure, List<AboutMeEntity>>> getRepoData() async {
    final useCaseCall = await AboutMeDomainRepoImpl().getAboutMeData();
    return useCaseCall;
  }
}
