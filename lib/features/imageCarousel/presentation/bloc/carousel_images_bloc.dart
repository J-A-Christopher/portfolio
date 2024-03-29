// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:portfolio/common/failures/failures.dart';
import 'package:portfolio/di/di.dart';
import 'package:portfolio/features/imageCarousel/domain/entities/image_domain_entity.dart';
import 'package:portfolio/features/imageCarousel/domain/usecases/image_usecase.dart';

part 'carousel_images_event.dart';
part 'carousel_images_state.dart';

@injectable

///[CarouselImagesBloc]Bloc class  intergrating the other two classes
class CarouselImagesBloc
    extends Bloc<CarouselImagesEvent, CarouselImagesState> {
  ///Our constructor and logic
  CarouselImagesBloc() : super(CarouselImagesInitial()) {
    final getData = getIt<ImageDataUsesCase>();
    String mapFailureToMessage(Failure failure) {
      switch (failure.runtimeType) {
        case ServerFailure:
          return 'OOps Server Failure. Try Again Later..';

        case GeneralFailure:
          return 'An error occured...Try again later';

        default:
          return 'Something went wrong... Are you online?';
      }
    }

    on<GetCarouselImages>((event, emit) async {
      emit(CarouselImagesInitial());
      emit(CarouselImagesLoading());
      final imageData = await getData.getImageUseCase();
      imageData.fold(
          (failure) => emit(
              CarouselImagesError(errorMessage: mapFailureToMessage(failure))),
          (imageData) => emit(CarouselImagesLoaded(imageObject: imageData)));
    });
  }
}
