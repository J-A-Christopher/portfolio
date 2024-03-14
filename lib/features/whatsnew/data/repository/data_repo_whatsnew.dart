import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:portfolio/common/exceptions/exception.dart';
import 'package:portfolio/common/failures/failures.dart';
import 'package:portfolio/di/di.dart';
import 'package:portfolio/features/whatsnew/data/datasorce/whatsnew_datasource.dart';
import 'package:portfolio/features/whatsnew/domain/entity/whatsnew_entity.dart';
import 'package:portfolio/features/whatsnew/domain/repository/dom_repo.dart';

@Injectable(as: RepoWhatsNew)
class WhatsNewSourceImpl implements RepoWhatsNew {
  @override
  Future<Either<Failure, List<WhatsNewEntity>>> getWhatsNew() async {
    try {
      final dataSource = getIt<WhatsNewDataSource>();
      final endResult = await dataSource.getWhatsNew();
      return right(endResult);
    } on ServerException catch (_) {
      return left(ServerFailure());
    } catch (e) {
      return left(GeneralFailure());
    }
  }
}