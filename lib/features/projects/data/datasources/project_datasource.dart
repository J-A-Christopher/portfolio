import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:portfolio/common/constants/constants.dart';
import 'package:portfolio/common/exceptions/exception.dart';
import 'package:portfolio/features/projects/data/models/project_model.dart';

abstract class ProjectDataSource {
  Future<List<ProjectModel>> getProjects();
}

@Injectable(as: ProjectDataSource)
class ProjectModelImpl implements ProjectDataSource {
  @override
  Future<List<ProjectModel>> getProjects() async {
    final dio = Dio();
    const projUrl = '$baseServerUrl/project-details';
    Response response = await dio.get(projUrl);
    if (response.statusCode == 200) {
      var projData = (response.data['data'] as List<dynamic>)
          .map((projItem) => ProjectModel.fromJson(projItem))
          .toList();
      return projData;
    } else {
      throw ServerException();
    }
  }
}
