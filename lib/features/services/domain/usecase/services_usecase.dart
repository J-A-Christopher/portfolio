import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:portfolio/common/failures/failures.dart';
import 'package:portfolio/di/di.dart';
import 'package:portfolio/features/services/domain/entity/service_entity.dart';
import 'package:portfolio/features/services/domain/repository/services_repo.dart';

@injectable
class ServiceUseCase {
  Future<Either<Failure, List<ServicesEntity>>> getServiceUseCase() async {
    final result = await getIt<ServiceRepos>().getServices();
    return result;
  }
}
