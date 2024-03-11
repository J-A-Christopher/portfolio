import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:portfolio/common/failures/failures.dart';
import 'package:portfolio/di/di.dart';
import 'package:portfolio/features/blogs/domain/entities/blog_entity.dart';
import 'package:portfolio/features/blogs/domain/usecases/blog_usecases.dart';

part 'blogs_event.dart';
part 'blogs_state.dart';

@injectable
class BlogsBloc extends Bloc<BlogsEvent, BlogsState> {
  BlogsBloc() : super(BlogsInitial()) {
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

    on<GetBlogs>((event, emit) async {
      final blogUseCases = getIt<BlogUseCases>();
      emit(BlogsLoading());
      final blogData = await blogUseCases.blogUseCases();
      blogData.fold(
        (failure) => emit(BlogsError(error: mapFailureToMessage(failure))),
        (blogResponse) {
          emit(BlogsLoaded(blogEntity: blogResponse));
        },
      );
    });
  }
}
