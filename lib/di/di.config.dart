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
    as _i19;
import 'package:portfolio/features/blogs/domain/repositories/domain_repository.dart'
    as _i18;
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
    as _i23;
import 'package:portfolio/features/imageCarousel/data/repositories/image_data_repo.dart'
    as _i26;
import 'package:portfolio/features/imageCarousel/domain/repository/image_domain_repo.dart'
    as _i25;
import 'package:portfolio/features/imageCarousel/domain/usecases/image_usecase.dart'
    as _i24;
import 'package:portfolio/features/imageCarousel/presentation/bloc/carousel_images_bloc.dart'
    as _i10;
import 'package:portfolio/features/notifications/data/datasource/image_ds.dart'
    as _i20;
import 'package:portfolio/features/notifications/data/repository/image_repo_data.dart'
    as _i17;
import 'package:portfolio/features/notifications/domain/repository/image_dom_repo.dart'
    as _i16;
import 'package:portfolio/features/notifications/domain/usecase/image_uescase.dart'
    as _i22;
import 'package:portfolio/features/notifications/presentations/bloc/image_repo_bloc.dart'
    as _i27;
import 'package:portfolio/features/projects/data/datasources/project_datasource.dart'
    as _i29;
import 'package:portfolio/features/projects/data/repository/proj_dat_repo.dart'
    as _i31;
import 'package:portfolio/features/projects/domain/repository/proj_repos.dart'
    as _i30;
import 'package:portfolio/features/projects/domain/usecases/proj_usecases.dart'
    as _i28;
import 'package:portfolio/features/projects/presentation/bloc/projects_bloc.dart'
    as _i32;
import 'package:portfolio/features/resume/data/datadsources/datasources.dart'
    as _i21;
import 'package:portfolio/features/resume/data/repository/resume_data_repo.dart'
    as _i38;
import 'package:portfolio/features/resume/domain/repository/resume_dom_re.dart'
    as _i37;
import 'package:portfolio/features/resume/domain/usecases/resume_usecase.dart'
    as _i36;
import 'package:portfolio/features/resume/presentation/bloc/resume_bloc.dart'
    as _i35;
import 'package:portfolio/features/services/data/datasources/service_datasource.dart'
    as _i39;
import 'package:portfolio/features/services/data/repository/services_data_repo.dart'
    as _i41;
import 'package:portfolio/features/services/domain/repository/services_repo.dart'
    as _i40;
import 'package:portfolio/features/services/domain/usecase/services_usecase.dart'
    as _i42;
import 'package:portfolio/features/services/presentation/bloc/services_bloc.dart'
    as _i43;
import 'package:portfolio/features/welcomeCard/data/datasources/aboutme_datasource.dart'
    as _i3;
import 'package:portfolio/features/welcomeCard/data/repository/aboutme_data_repo.dart'
    as _i5;
import 'package:portfolio/features/welcomeCard/domain/repositories/welcome.repo.dart'
    as _i4;
import 'package:portfolio/features/welcomeCard/domain/usecases/welcome_usecase.dart'
    as _i44;
import 'package:portfolio/features/welcomeCard/presentation/bloc/bio_card_bloc.dart'
    as _i6;
import 'package:portfolio/features/whatsnew/data/datasorce/whatsnew_datasource.dart'
    as _i46;
import 'package:portfolio/features/whatsnew/data/repository/data_repo_whatsnew.dart'
    as _i34;
import 'package:portfolio/features/whatsnew/domain/repository/dom_repo.dart'
    as _i33;
import 'package:portfolio/features/whatsnew/domain/usecases/whatsnew_usecase.dart'
    as _i47;
import 'package:portfolio/features/whatsnew/presentation/bloc/whats_new_bloc.dart'
    as _i45;

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
    gh.factory<_i16.DomainImageRepo>(() => _i17.ImageRepoDatImpl());
    gh.factory<_i18.DomainRepository>(() => _i19.BlogSourceImpl());
    gh.factory<_i20.GetImageString>(() => _i20.ImageDataSourceImpl());
    gh.factory<_i21.GetResumeFunc>(() => _i21.BlogDataSourceImpl());
    gh.factory<_i22.ImageCases>(() => _i22.ImageCases());
    gh.factory<_i23.ImageDataSource>(() => _i23.ImageDataSourceImpl());
    gh.factory<_i24.ImageDataUsesCase>(() => _i24.ImageDataUsesCase());
    gh.factory<_i25.ImageRepo>(() => _i26.ImageRepoImpl());
    gh.factory<_i27.ImageRepoBloc>(() => _i27.ImageRepoBloc());
    gh.factory<_i28.ProjUseCase>(() => _i28.ProjUseCase());
    gh.factory<_i29.ProjectDataSource>(() => _i29.ProjectModelImpl());
    gh.factory<_i30.ProjectRepo>(() => _i31.ProjRepoImpl());
    gh.factory<_i32.ProjectsBloc>(() => _i32.ProjectsBloc());
    gh.factory<_i33.RepoWhatsNew>(() => _i34.WhatsNewSourceImpl());
    gh.factory<_i35.ResumeBloc>(() => _i35.ResumeBloc());
    gh.factory<_i36.ResumeCases>(() => _i36.ResumeCases());
    gh.factory<_i37.ResumeRep>(() => _i38.ResumeSourceImpl());
    gh.factory<_i39.ServiceDataSource>(() => _i39.ServiceDataSourceImpl());
    gh.factory<_i40.ServiceRepos>(() => _i41.ServicesRepoImpl());
    gh.factory<_i42.ServiceUseCase>(() => _i42.ServiceUseCase());
    gh.factory<_i43.ServicesBloc>(() => _i43.ServicesBloc());
    gh.factory<_i44.WelcomeUseCase>(() => _i44.WelcomeUseCase());
    gh.factory<_i45.WhatsNewBloc>(() => _i45.WhatsNewBloc());
    gh.factory<_i46.WhatsNewDataSource>(() => _i46.WhatsNewDataSourceImpl());
    gh.factory<_i47.WhatsNewUseCases>(() => _i47.WhatsNewUseCases());
    return this;
  }
}
