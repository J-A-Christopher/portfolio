import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:portfolio/common/failures/failures.dart';
import 'package:portfolio/features/resume/domain/entities/resume_entity.dart';
import 'package:portfolio/features/resume/domain/usecases/resume_usecase.dart';

import '../../../../di/di.dart';

part 'resume_event.dart';
part 'resume_state.dart';

@injectable
class ResumeBloc extends Bloc<ResumeEvent, ResumeState> {
  ResumeBloc() : super(ResumeInitial()) {
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

    on<GetResume>((event, emit) async {
      final resumeUseCases = getIt<ResumeCases>();
      emit(ResumeLoading());
      final blogData = await resumeUseCases.resumeUseCases();
      blogData.fold(
        (failure) =>
            emit(ResumeError(errorMesage: mapFailureToMessage(failure))),
        (resResponse) {
          emit(ResumeLoaded(resData: resResponse));
        },
      );
    });
  }
}
