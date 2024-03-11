import 'package:dartz/dartz.dart';
import 'package:portfolio/common/failures/failures.dart';
import 'package:portfolio/features/resume/domain/entities/resume_entity.dart';

abstract class ResumeRep {
  Future <Either<Failure ,ResumeEntity>> getResume();
}
