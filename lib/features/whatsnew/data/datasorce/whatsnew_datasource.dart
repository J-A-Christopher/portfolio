import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:portfolio/common/constants/constants.dart';
import 'package:portfolio/common/exceptions/exception.dart';
import 'package:portfolio/features/whatsnew/data/model/whatsnew_model.dart';
import 'package:portfolio/features/whatsnew/presentation/bloc/whats_new_bloc.dart';

abstract class WhatsNewDataSource {
  Future<List<WhatsNewModel>> getWhatsNew();
}
@Injectable(as: WhatsNewDataSource)
class WhatsNewDataSourceImpl implements WhatsNewDataSource {
  @override
  Future<List<WhatsNewModel>> getWhatsNew() async {
    final dio = Dio();
    const whatsNewUrl = '$baseServerUrl/whats-new';
    Response response = await dio.get(whatsNewUrl);
    if (response.statusCode == 200) {
      print(response.data);
      final whatsNew = (response.data['data'] as List<dynamic>)
          .map((whatsNew) => WhatsNewModel.fromJson(whatsNew))
          .toList();
     
      return whatsNew;
    } else {
      throw ServerException();
    }
  }
}
