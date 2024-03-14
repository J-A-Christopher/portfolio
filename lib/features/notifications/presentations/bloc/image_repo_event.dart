part of 'image_repo_bloc.dart';

abstract class ImageRepoEvent extends Equatable {
  const ImageRepoEvent();

  @override
  List<Object> get props => [];
}

class GetImage extends ImageRepoEvent{}
