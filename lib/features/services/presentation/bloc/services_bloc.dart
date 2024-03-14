import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:portfolio/common/failures/failures.dart';
import 'package:portfolio/di/di.dart';
import 'package:portfolio/features/services/domain/entity/service_entity.dart';
import 'package:portfolio/features/services/domain/usecase/services_usecase.dart';

part 'services_event.dart';
part 'services_state.dart';

@injectable
class ServicesBloc extends Bloc<ServicesEvent, ServicesState> {
  ServicesBloc() : super(ServicesInitial()) {
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

    on<GetService>((event, emit) async {
      final serviceUseCases = getIt<ServiceUseCase>();
      emit(ServicesLoading());
      final blogData = await serviceUseCases.getServiceUseCase();
      blogData.fold(
        (failure) =>
            emit(ServiceError(errorMessage: mapFailureToMessage(failure))),
        (servResponse) {
          emit(ServicesLoaded(servicesData: servResponse));
        },
      );
    });
  }
}
