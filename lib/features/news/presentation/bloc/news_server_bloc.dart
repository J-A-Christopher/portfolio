import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:portfolio/common/failures/failures.dart';
import 'package:portfolio/di/di.dart';
import 'package:portfolio/features/news/domain/entities/news_entity.dart';
import 'package:portfolio/features/news/domain/usecases/news_usecase.dart';

part 'news_server_event.dart';
part 'news_server_state.dart';

@injectable
class NewsServerBloc extends Bloc<NewsServerEvent, NewsServerState> {
  NewsServerBloc() : super(NewsServerInitial()) {
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

    on<GetNewsData>((event, emit) async{
      final newsUseCases = getIt<NewsUseCases>();
      emit(NewsServerLoading());
      final newsData = await newsUseCases.newsUseCases();
      newsData.fold(
        (failure) => emit(NewsServerError(errorMessage: mapFailureToMessage(failure))),
        (newsResponse) {
          emit(NewsServerLoaded(newsData: newsResponse));
        },
      );
     
    });
  }
}
