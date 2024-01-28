import 'package:dio/dio.dart';
import 'package:portfolio/common/exceptions/exception.dart';
import 'package:portfolio/features/welcomeCard/data/model/aboutme_model.dart';

abstract class AboutMe {
  Future<List<AboutMeModel>> getAboutData();
}

class AboutMeImpl implements AboutMe {
  @override
  Future<List<AboutMeModel>> getAboutData() async {
    final dio = Dio();
    final Response response =
        await dio.get('http://10.0.2.2:8080/portfolio/aboutme');
   
    if (response.statusCode != 200) {
      throw ServerException();
    } else {
      final List<AboutMeModel> aboutMeList = [];
      for (var aboutMe in response.data) {
        var aboutMeObject = AboutMeModel.fromJson(aboutMe);
        aboutMeList.add(aboutMeObject);
      }
      return aboutMeList;
    }
  }
}