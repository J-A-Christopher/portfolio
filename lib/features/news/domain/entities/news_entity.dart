import 'package:equatable/equatable.dart';

class NewsEntity extends Equatable{
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
 const NewsEntity({this.description, this.title, this.url, this.urlToImage});
  
  @override
  List<Object?> get props => [title, description, url, urlToImage];
}
