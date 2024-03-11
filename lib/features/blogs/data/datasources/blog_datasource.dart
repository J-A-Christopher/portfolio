import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:portfolio/common/constants/constants.dart';
import 'package:portfolio/common/exceptions/exception.dart';
import 'package:portfolio/features/blogs/data/model/blogs_model.dart';

abstract class BlogDataSource {
  Future<List<BlogsModel>> getBlogs();
}
@Injectable(as: BlogDataSource)
class BlogDataSourceImpl implements BlogDataSource {
  @override
  Future<List<BlogsModel>> getBlogs() async {
    final dio = Dio();
    const blogUrl = '$baseServerUrl/blog-details';
    Response response = await dio.get(blogUrl);
    if (response.statusCode == 200) {
      print(response.data);
      final blogs = (response.data['data'] as List<dynamic>)
          .map((blog) => BlogsModel.fromJson(blog))
          .toList();
      print(blogs);
      return blogs;
    } else {
      throw ServerException();
    }
  }
}
