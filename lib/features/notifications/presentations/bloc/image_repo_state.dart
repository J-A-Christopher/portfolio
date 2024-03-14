part of 'image_repo_bloc.dart';

abstract class ImageRepoState extends Equatable {
  const ImageRepoState();

  @override
  List<Object> get props => [];
}

class ImageRepoInitial extends ImageRepoState {}

class ImageRepoLoading extends ImageRepoState {}

class ImageRepoLoaded extends ImageRepoState {
  final OfficePictureEntity imgData;
 const ImageRepoLoaded({required this.imgData});
}

class ImageRepoError extends ImageRepoState {
  final String errorMessage;
  const ImageRepoError({required this.errorMessage});
}
