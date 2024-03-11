import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:portfolio/common/exceptions/exception.dart';
import 'package:portfolio/common/failures/failures.dart';
import 'package:portfolio/di/di.dart';
import 'package:portfolio/features/projects/data/datasources/project_datasource.dart';
import 'package:portfolio/features/projects/domain/entities/project_entity.dart';
import 'package:portfolio/features/projects/domain/repository/proj_repos.dart';

@Injectable(as: ProjectRepo)
class ProjRepoImpl implements ProjectRepo {
  @override
  Future<Either<Failure, List<ProjectEntity>>> getProj() async {
    try {
      final projData = await getIt<ProjectDataSource>().getProjects();
      return right(projData);
    } on ServerException catch (_) {
      return left(ServerFailure());
    } catch (e) {
      print('me${e.toString()}');
      return left(GeneralFailure());
    }
  }
}
