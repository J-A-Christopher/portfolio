import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:portfolio/di/di.dart';
import 'package:portfolio/features/welcomeCard/domain/entities/aboume_entity.dart';
import 'package:portfolio/features/welcomeCard/domain/usecases/welcome_usecase.dart';

part 'bio_card_event.dart';
part 'bio_card_state.dart';

@injectable
class BioCardBloc extends Bloc<BioCardEvent, BioCardState> {
  BioCardBloc() : super(BioCardInitial()) {
    final getBioData =getIt<WelcomeUseCase>();
    on<RetrieveBioCardData>((event, emit) async {
      emit(BioCardInitial());
      emit(BioCardLoading());
      final result = await getBioData.getRepoData();
      result.fold(
        (error) => emit(BioCardError()),
        (result) => emit(BioCardLoaded(aboutData: result)),
      );
    });
  }
}
