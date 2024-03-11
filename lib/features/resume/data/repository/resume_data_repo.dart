import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:portfolio/common/exceptions/exception.dart';
import 'package:portfolio/common/failures/failures.dart';
import 'package:portfolio/di/di.dart';
import 'package:portfolio/features/resume/data/datadsources/datasources.dart';
import 'package:portfolio/features/resume/domain/entities/resume_entity.dart';
import 'package:portfolio/features/resume/domain/repository/resume_dom_re.dart';

@Injectable(as: ResumeRep )
class ResumeSourceImpl implements ResumeRep  {
  @override
  Future<Either<Failure, ResumeEntity>> getResume() async {
    try {
      final dataSource = getIt<GetResumeFunc>();
      final endResult = await dataSource.getResume();
      return right(endResult);
    } on ServerException catch (_) {
      return left(ServerFailure());
    } catch (e) {
      return left(GeneralFailure());
    }
  }
}