// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:portfolio/features/imageCarousel/data/datasources/image_carousel_datasource.dart'
    as _i4;
import 'package:portfolio/features/imageCarousel/data/repositories/image_data_repo.dart'
    as _i7;
import 'package:portfolio/features/imageCarousel/domain/repository/image_domain_repo.dart'
    as _i6;
import 'package:portfolio/features/imageCarousel/domain/usecases/image_usecase.dart'
    as _i5;
import 'package:portfolio/features/imageCarousel/presentation/bloc/carousel_images_bloc.dart'
    as _i3;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.CarouselImagesBloc>(() => _i3.CarouselImagesBloc());
    gh.factory<_i4.ImageDataSource>(() => _i4.ImageDataSourceImpl());
    gh.factory<_i5.ImageDataUsesCase>(() => _i5.ImageDataUsesCase());
    gh.factory<_i6.ImageRepo>(() => _i7.ImageRepoImpl());
    return this;
  }
}
