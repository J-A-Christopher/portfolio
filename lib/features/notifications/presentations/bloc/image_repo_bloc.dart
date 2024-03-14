import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:portfolio/common/failures/failures.dart';
import 'package:portfolio/di/di.dart';
import 'package:portfolio/features/notifications/domain/entity/image_ent.dart';
import 'package:portfolio/features/notifications/domain/usecase/image_uescase.dart';

part 'image_repo_event.dart';
part 'image_repo_state.dart';

@injectable
class ImageRepoBloc extends Bloc<ImageRepoEvent, ImageRepoState> {
  ImageRepoBloc() : super(ImageRepoInitial()) {
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

    on<GetImage>((event, emit) async {
      final imageUseCases = getIt<ImageCases>();
      emit(ImageRepoLoading());
      final blogData = await imageUseCases.imageUseCases();
      blogData.fold(
        (failure) =>
            emit(ImageRepoError(errorMessage: mapFailureToMessage(failure))),
        (resResponse) {
          emit(ImageRepoLoaded(imgData: resResponse));
        },
      );
    });
  }
}
