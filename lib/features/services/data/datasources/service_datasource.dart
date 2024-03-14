import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:portfolio/common/constants/constants.dart';
import 'package:portfolio/common/exceptions/exception.dart';
import 'package:portfolio/features/services/data/model/services_model.dart';

abstract class ServiceDataSource {
  Future<List<ServicesModel>> getServices();
}


@Injectable(as: ServiceDataSource)
class ServiceDataSourceImpl implements ServiceDataSource {
  @override
  Future<List<ServicesModel>> getServices() async {
    final dio = Dio();
    const serviceUrl = '$baseServerUrl/services';
    Response response = await dio.get(serviceUrl);
    if (response.statusCode == 200) {
      print(response.data);
      final services = (response.data['data'] as List<dynamic>)
          .map((service) => ServicesModel.fromJson(service))
          .toList();
      print(services);
      return services;
    } else {
      throw ServerException();
    }
  }
}

