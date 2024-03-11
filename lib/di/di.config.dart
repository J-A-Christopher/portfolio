// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:portfolio/features/blogs/data/datasources/blog_datasource.dart'
    as _i7;
import 'package:portfolio/features/blogs/data/repository/datasourcesrepo.dart'
    as _i17;
import 'package:portfolio/features/blogs/domain/repositories/domain_repository.dart'
    as _i16;
import 'package:portfolio/features/blogs/domain/usecases/blog_usecases.dart'
    as _i8;
import 'package:portfolio/features/blogs/presentation/bloc/blogs_bloc.dart'
    as _i9;
import 'package:portfolio/features/contacts/data/datasources/contact_datasource.dart'
    as _i11;
import 'package:portfolio/features/contacts/data/repositories/contact_data_repository.dart'
    as _i14;
import 'package:portfolio/features/contacts/domain/repositories/contact_info_repo.dart'
    as _i13;
import 'package:portfolio/features/contacts/domain/usecases/contact_usecase.dart'
    as _i15;
import 'package:portfolio/features/contacts/presentation/bloc/contact_info_bloc.dart'
    as _i12;
import 'package:portfolio/features/imageCarousel/data/datasources/image_carousel_datasource.dart'
    as _i18;
import 'package:portfolio/features/imageCarousel/data/repositories/image_data_repo.dart'
    as _i21;
import 'package:portfolio/features/imageCarousel/domain/repository/image_domain_repo.dart'
    as _i20;
import 'package:portfolio/features/imageCarousel/domain/usecases/image_usecase.dart'
    as _i19;
import 'package:portfolio/features/imageCarousel/presentation/bloc/carousel_images_bloc.dart'
    as _i10;
import 'package:portfolio/features/projects/data/datasources/project_datasource.dart'
    as _i23;
import 'package:portfolio/features/projects/data/repository/proj_dat_repo.dart'
    as _i25;
import 'package:portfolio/features/projects/domain/repository/proj_repos.dart'
    as _i24;
import 'package:portfolio/features/projects/domain/usecases/proj_usecases.dart'
    as _i22;
import 'package:portfolio/features/projects/presentation/bloc/projects_bloc.dart'
    as _i26;
import 'package:portfolio/features/welcomeCard/data/datasources/aboutme_datasource.dart'
    as _i3;
import 'package:portfolio/features/welcomeCard/data/repository/aboutme_data_repo.dart'
    as _i5;
import 'package:portfolio/features/welcomeCard/domain/repositories/welcome.repo.dart'
    as _i4;
import 'package:portfolio/features/welcomeCard/domain/usecases/welcome_usecase.dart'
    as _i27;
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
    gh.factory<_i7.BlogDataSource>(() => _i7.BlogDataSourceImpl());
    gh.factory<_i8.BlogUseCases>(() => _i8.BlogUseCases());
    gh.factory<_i9.BlogsBloc>(() => _i9.BlogsBloc());
    gh.factory<_i10.CarouselImagesBloc>(() => _i10.CarouselImagesBloc());
    gh.factory<_i11.ContactDataSource>(() => _i11.ContactDataSourceImpl());
    gh.factory<_i12.ContactInfoBloc>(() => _i12.ContactInfoBloc());
    gh.factory<_i13.ContactInfoDomainRepository>(
        () => _i14.ContactDataRepository());
    gh.factory<_i15.ContactUseCase>(() => _i15.ContactUseCase());
    gh.factory<_i16.DomainRepository>(() => _i17.BlogSourceImpl());
    gh.factory<_i18.ImageDataSource>(() => _i18.ImageDataSourceImpl());
    gh.factory<_i19.ImageDataUsesCase>(() => _i19.ImageDataUsesCase());
    gh.factory<_i20.ImageRepo>(() => _i21.ImageRepoImpl());
    gh.factory<_i22.ProjUseCase>(() => _i22.ProjUseCase());
    gh.factory<_i23.ProjectDataSource>(() => _i23.ProjectModelImpl());
    gh.factory<_i24.ProjectRepo>(() => _i25.ProjRepoImpl());
    gh.factory<_i26.ProjectsBloc>(() => _i26.ProjectsBloc());
    gh.factory<_i27.WelcomeUseCase>(() => _i27.WelcomeUseCase());
    return this;
  }
}
