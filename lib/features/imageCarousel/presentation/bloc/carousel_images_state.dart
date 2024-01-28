part of 'carousel_images_bloc.dart';

///Abstract class for our state
abstract class CarouselImagesState extends Equatable {
  ///Our constructor
  const CarouselImagesState();

  @override
  List<Object> get props => [];
}

///Initial State class
class CarouselImagesInitial extends CarouselImagesState {}

///Loading state class
class CarouselImagesLoading extends CarouselImagesState {}

///Loaded State class
class CarouselImagesLoaded extends CarouselImagesState {
  final List<CarouselImageEntity> imageObject;
  const CarouselImagesLoaded({required this.imageObject});
   @override
  List<Object> get props => [imageObject];
}

///Error State Class
class CarouselImagesError extends CarouselImagesState {
 final String errorMessage;
  const CarouselImagesError({required this.errorMessage});
   @override
  List<Object> get props => [errorMessage];
}
