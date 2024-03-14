import 'package:equatable/equatable.dart';
import 'package:portfolio/features/news/domain/entities/news_entity.dart';

class NewsModel extends NewsEntity with EquatableMixin{
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  NewsModel(
      {required this.description,
      required this.title,
      required this.url,
      required this.urlToImage});

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
        description: json['description'],
        title: json['title'],
        url: json['url'],
        urlToImage: json['urlToImage']);
  }

  Map<String, dynamic> toJson() {
    return {
      'title':title,
      'description': description,
      'url':url,
      'urlToImage': urlToImage
    };
  }
}
