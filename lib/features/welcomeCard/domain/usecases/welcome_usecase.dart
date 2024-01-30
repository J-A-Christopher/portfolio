import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:portfolio/common/failures/failures.dart';
import 'package:portfolio/di/di.dart';
import 'package:portfolio/features/welcomeCard/domain/entities/aboume_entity.dart';
import 'package:portfolio/features/welcomeCard/domain/repositories/welcome.repo.dart';

@injectable
class WelcomeUseCase {
  Future<Either<Failure, List<AboutMeEntity>>> getRepoData() async {
    final useCaseCall = await getIt<AboutMeDomainRepo>().getAboutMeData();
    return useCaseCall;
  }
}
