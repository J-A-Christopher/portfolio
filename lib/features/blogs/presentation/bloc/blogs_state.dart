part of 'blogs_bloc.dart';

abstract class BlogsState extends Equatable {
  const BlogsState();

  @override
  List<Object> get props => [];
}

class BlogsInitial extends BlogsState {}

class BlogsLoading extends BlogsState {}

class BlogsLoaded extends BlogsState {
  const BlogsLoaded({required this.blogEntity});
  final List<BlogEntity> blogEntity;
}

class BlogsError extends BlogsState {
  const BlogsError({required this.error});

  final String error;
}
