import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:portfolio/common/exceptions/exception.dart';
import 'package:portfolio/common/failures/failures.dart';
import 'package:portfolio/di/di.dart';
import 'package:portfolio/features/services/data/datasources/service_datasource.dart';
import 'package:portfolio/features/services/domain/entity/service_entity.dart';
import 'package:portfolio/features/services/domain/repository/services_repo.dart';

@Injectable(as: ServiceRepos)
class ServicesRepoImpl implements ServiceRepos {
  @override
  Future<Either<Failure, List<ServicesEntity>>>
      getServices() async {
    try {
      final serviceData = await getIt<ServiceDataSource>().getServices();
      return right(serviceData);
    } on ServerException catch (_) {
      return left(ServerFailure());
    } catch (e) {
      print('me${e.toString()}');
      return left(GeneralFailure());
    }
  }
}