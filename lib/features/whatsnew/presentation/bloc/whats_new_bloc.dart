import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:portfolio/common/failures/failures.dart';
import 'package:portfolio/di/di.dart';
import 'package:portfolio/features/whatsnew/domain/entity/whatsnew_entity.dart';
import 'package:portfolio/features/whatsnew/domain/usecases/whatsnew_usecase.dart';

part 'whats_new_event.dart';
part 'whats_new_state.dart';

@injectable
class WhatsNewBloc extends Bloc<WhatsNewEvent, WhatsNewState> {
  WhatsNewBloc() : super(WhatsNewInitial()) {
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

    on<GetWhatsNew>((event, emit) async {
      final whatsNewUseCases = getIt<WhatsNewUseCases>();
      emit(WhatsNewLoading());
      final whatsNewData = await whatsNewUseCases.whatsNewUseCases();
      whatsNewData.fold(
        (failure) =>
            emit(WhatsNewError(errorMessage: mapFailureToMessage(failure))),
        (whatsNewResResponse) {
          emit(WhatsNewLoaded(whatsNewEntity: whatsNewResResponse));
        },
      );
    });
  }
}
