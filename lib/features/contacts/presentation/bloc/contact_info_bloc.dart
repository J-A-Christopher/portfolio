import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:portfolio/common/failures/failures.dart';
import 'package:portfolio/di/di.dart';
import 'package:portfolio/features/contacts/domain/entities/contact_info_entity.dart';
import 'package:portfolio/features/contacts/domain/usecases/contact_usecase.dart';

part 'contact_info_event.dart';
part 'contact_info_state.dart';

@injectable
class ContactInfoBloc extends Bloc<ContactInfoEvent, ContactInfoState> {
  ContactInfoBloc() : super(ContactInfoInitial()) {
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

    on<PostContactInfo>((event, emit) async {
      final contactUseCases = getIt<ContactUseCase>();
      emit(ContactInfoInitial());
      emit(ContactInfoLoading());
      final contactData =
          await contactUseCases.contactUseCases(event.contactInfo);
      contactData.fold(
        (failure) =>
            emit(ContactInfoError(errorMessage: mapFailureToMessage(failure))),
        (contactResponse) {
          emit(ContactInfoLoaded(contactResponse: contactResponse));
        },
      );
    });
  }
}
