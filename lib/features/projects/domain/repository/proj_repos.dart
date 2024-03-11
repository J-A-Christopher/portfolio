import 'package:dartz/dartz.dart';
import 'package:portfolio/common/failures/failures.dart';
import 'package:portfolio/features/projects/domain/entities/project_entity.dart';

abstract class ProjectRepo{
  Future<Either<Failure ,List<ProjectEntity>>>getProj();
}