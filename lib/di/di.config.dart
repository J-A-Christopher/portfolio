// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:portfolio/features/contacts/data/datasources/contact_datasource.dart'
    as _i8;
import 'package:portfolio/features/contacts/data/repositories/contact_data_repository.dart'
    as _i11;
import 'package:portfolio/features/contacts/domain/repositories/contact_info_repo.dart'
    as _i10;
import 'package:portfolio/features/contacts/domain/usecases/contact_usecase.dart'
    as _i12;
import 'package:portfolio/features/contacts/presentation/bloc/contact_info_bloc.dart'
    as _i9;
import 'package:portfolio/features/imageCarousel/data/datasources/image_carousel_datasource.dart'
    as _i13;
import 'package:portfolio/features/imageCarousel/data/repositories/image_data_repo.dart'
    as _i16;
import 'package:portfolio/features/imageCarousel/domain/repository/image_domain_repo.dart'
    as _i15;
import 'package:portfolio/features/imageCarousel/domain/usecases/image_usecase.dart'
    as _i14;
import 'package:portfolio/features/imageCarousel/presentation/bloc/carousel_images_bloc.dart'
    as _i7;
import 'package:portfolio/features/welcomeCard/data/datasources/aboutme_datasource.dart'
    as _i3;
import 'package:portfolio/features/welcomeCard/data/repository/aboutme_data_repo.dart'
    as _i5;
import 'package:portfolio/features/welcomeCard/domain/repositories/welcome.repo.dart'
    as _i4;
import 'package:portfolio/features/welcomeCard/domain/usecases/welcome_usecase.dart'
    as _i17;
import 'package:portfolio/features/welcomeCard/presentation/bloc/bio_card_bloc.dart'
    as _i6;

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
    gh.factory<_i3.AboutMe>(() => _i3.AboutMeImpl());
    gh.factory<_i4.AboutMeDomainRepo>(() => _i5.AboutMeDomainRepoImpl());
    gh.factory<_i6.BioCardBloc>(() => _i6.BioCardBloc());
    gh.factory<_i7.CarouselImagesBloc>(() => _i7.CarouselImagesBloc());
    gh.factory<_i8.ContactDataSource>(() => _i8.ContactDataSourceImpl());
    gh.factory<_i9.ContactInfoBloc>(() => _i9.ContactInfoBloc());
    gh.factory<_i10.ContactInfoDomainRepository>(
        () => _i11.ContactDataRepository());
    gh.factory<_i12.ContactUseCase>(() => _i12.ContactUseCase());
    gh.factory<_i13.ImageDataSource>(() => _i13.ImageDataSourceImpl());
    gh.factory<_i14.ImageDataUsesCase>(() => _i14.ImageDataUsesCase());
    gh.factory<_i15.ImageRepo>(() => _i16.ImageRepoImpl());
    gh.factory<_i17.WelcomeUseCase>(() => _i17.WelcomeUseCase());
    return this;
  }
}
