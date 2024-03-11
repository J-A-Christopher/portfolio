import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:portfolio/common/failures/failures.dart';
import 'package:portfolio/di/di.dart';
import 'package:portfolio/features/projects/domain/entities/project_entity.dart';
import 'package:portfolio/features/projects/domain/repository/proj_repos.dart';

@injectable
class ProjUseCase {
  Future<Either<Failure, List<ProjectEntity>>> getProjUseCase() async {
    final result = await getIt<ProjectRepo>().getProj();
    return result;
  }
}
