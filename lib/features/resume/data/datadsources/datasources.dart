import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:portfolio/common/constants/constants.dart';
import 'package:portfolio/common/exceptions/exception.dart';
import 'package:portfolio/features/resume/data/model/resume_model.dart';

abstract class GetResumeFunc {
  Future<ResumeModel> getResume();
}

@Injectable(as: GetResumeFunc)
class BlogDataSourceImpl implements GetResumeFunc {
  @override
  Future<ResumeModel> getResume() async {
    final dio = Dio();
    const resumeUrl = '$baseServerUrl/resume';
    Response response = await dio.get(resumeUrl);
    if (response.statusCode == 200) {
      response.data['data'];
      final resume = (response.data['data'] as List).first;
      final resultantData = ResumeModel.fromJson(resume);
      print('MM$resume');

      return resultantData;
    } else {
      throw ServerException();
    }
  }
}
