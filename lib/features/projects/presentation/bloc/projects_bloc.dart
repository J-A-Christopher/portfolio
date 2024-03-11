import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:portfolio/common/failures/failures.dart';
import 'package:portfolio/di/di.dart';
import 'package:portfolio/features/projects/domain/entities/project_entity.dart';
import 'package:portfolio/features/projects/domain/usecases/proj_usecases.dart';

part 'projects_event.dart';
part 'projects_state.dart';

@injectable
class ProjectsBloc extends Bloc<ProjectsEvent, ProjectsState> {
  ProjectsBloc() : super(ProjectsInitial()) {
    final getProjData = getIt<ProjUseCase>();
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

    on<GetProjects>((event, emit) async {
      emit(ProjectsLoading());
      final projData = await getProjData.getProjUseCase();
      projData.fold(
          (failure) =>
              emit(ProjectsError(errorMessage: mapFailureToMessage(failure))),
          (projData) => emit(ProjectsLoaded(projData: projData)));
    });
  }
}
