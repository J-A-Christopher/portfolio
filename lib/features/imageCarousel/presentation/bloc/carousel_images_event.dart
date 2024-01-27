part of 'carousel_images_bloc.dart';

///Abstract class for our Bloc Events
abstract class CarouselImagesEvent extends Equatable {
  ///Our constructor
  const CarouselImagesEvent();

  @override
  List<Object> get props => [];
}

///Our class that extends the above functionality
class GetCarouselImages extends CarouselImagesEvent {
  ///Constructor
  const GetCarouselImages();
}
