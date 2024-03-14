part of 'news_server_bloc.dart';

abstract class NewsServerState extends Equatable {
  const NewsServerState();

  @override
  List<Object> get props => [];
}

class NewsServerInitial extends NewsServerState {}

class NewsServerLoading extends NewsServerState {}

class NewsServerLoaded extends NewsServerState {
  final List<NewsEntity> newsData;
  const NewsServerLoaded({required this.newsData});
}

class NewsServerError extends NewsServerState {
  final String errorMessage;
  const NewsServerError({required this.errorMessage});
}
