import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:portfolio/common/failures/failures.dart';
import 'package:portfolio/di/di.dart';
import 'package:portfolio/features/resume/domain/entities/resume_entity.dart';
import 'package:portfolio/features/resume/domain/repository/resume_dom_re.dart';

@injectable
class ResumeCases {
  Future<Either<Failure, ResumeEntity>> resumeUseCases() async {
    final resumeRepo = getIt<ResumeRep>();
    final result = resumeRepo.getResume();
    return result;
  }
}