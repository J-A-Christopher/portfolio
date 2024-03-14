import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:portfolio/common/failures/failures.dart';
import 'package:portfolio/di/di.dart';
import 'package:portfolio/features/whatsnew/domain/entity/whatsnew_entity.dart';
import 'package:portfolio/features/whatsnew/domain/repository/dom_repo.dart';

@injectable
class WhatsNewUseCases {
  Future<Either<Failure, List<WhatsNewEntity>>> whatsNewUseCases() async {
    final dataRepo = getIt<RepoWhatsNew>();
    final result = dataRepo.getWhatsNew();
    return result;
  }
}
