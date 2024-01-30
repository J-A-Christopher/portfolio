import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/common/util/app_global_bloc_observer.dart';
import 'package:portfolio/di/di.dart';
import 'package:portfolio/features/imageCarousel/presentation/bloc/carousel_images_bloc.dart';
import 'package:portfolio/common/util/home_screen.dart';
import 'package:portfolio/features/welcomeCard/presentation/bloc/bio_card_bloc.dart';

void main() {
  configureDependencies();
  Bloc.observer = AppGlobalBlocObserver();
  runApp(const Portfolio());
}

///[Portfolio] class which is the root widget of this app
class Portfolio extends StatelessWidget {
  ///constructor of this [Portfolio] app
  const Portfolio({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: FlexThemeData.light(
          scheme: FlexScheme.ebonyClay,
          visualDensity: FlexColorScheme.comfortablePlatformDensity,
          surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
          blendLevel: 9,
          subThemesData: const FlexSubThemesData(
            blendOnLevel: 10,
            blendOnColors: false,
          ),
          swapLegacyOnMaterial3: true,
          fontFamily: GoogleFonts.quicksand().fontFamily),
      darkTheme: FlexThemeData.dark(
        scheme: FlexScheme.ebonyClay,
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 15,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 20,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        swapLegacyOnMaterial3: true,
        fontFamily: GoogleFonts.quicksand().fontFamily,
        
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => getIt<CarouselImagesBloc>(),
          ),
          BlocProvider(
            create: (_) =>getIt< BioCardBloc>(),
          ),
        ],
        child: const HomeScreen(),
      ),
    );
  }
}
