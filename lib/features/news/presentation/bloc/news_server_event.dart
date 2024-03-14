part of 'news_server_bloc.dart';

abstract class NewsServerEvent extends Equatable {
  const NewsServerEvent();

  @override
  List<Object> get props => [];
}

class GetNewsData extends NewsServerEvent{}
