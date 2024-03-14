import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';
import 'package:portfolio/common/exceptions/exception.dart';
import 'package:portfolio/features/news/data/models/news_model.dart';

abstract class NewsDataSource {
  Future<List<NewsModel>> getNewsData();
}

@Injectable(as: NewsDataSource)
class NewsDataSourceImpl implements NewsDataSource {
  @override
  Future<List<NewsModel>> getNewsData() async {
    final dio = Dio();
    final apiKey = dotenv.env['APIKEY'];
    final newsUrl =
        'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=$apiKey';
    Response response = await dio.get(newsUrl);
    if (response.statusCode == 200) {
      print(response.data);
      final news = (response.data['articles'] as List<dynamic>)
          .map((news) => NewsModel.fromJson(news))
          .toList();

      return news;
    } else {
      throw ServerException();
    }
  }
}
