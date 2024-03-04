import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/common/router/app_router.dart';
import 'package:portfolio/common/util/app_global_bloc_observer.dart';
import 'package:portfolio/di/di.dart';
import 'package:portfolio/features/contacts/presentation/bloc/contact_info_bloc.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<CarouselImagesBloc>(),
        ),
        BlocProvider(
          create: (_) => getIt<BioCardBloc>(),
        ),
        BlocProvider(create: (_) => getIt<ContactInfoBloc>())
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        // Theme config for FlexColorScheme version 7.3.x. Make sure you use
        // same or higher package version, but still same major version. If you
        // use a lower package version, some properties may not be supported.
        // In that case remove them after copying this theme to your app.
        theme: FlexThemeData.light(
          colors: const FlexSchemeColor(
            primary: Color(0xffdc3535),
            primaryContainer: Color(0xff252a32),
            secondary: Color(0xffd17842),
            secondaryContainer: Color(0xffffdbcf),
            tertiary: Color(0xff0c0f14),
            tertiaryContainer: Color(0xff52555a),
            appBarColor: Color(0xffffdbcf),
            error: Color(0xffb00020),
          ),
          subThemesData: const FlexSubThemesData(
            interactionEffects: false,
            tintedDisabledControls: false,
            blendOnColors: false,
            useTextTheme: true,
            inputDecoratorBorderType: FlexInputBorderType.underline,
            inputDecoratorUnfocusedBorderIsColored: false,
            alignedDropdown: true,
            tooltipRadius: 4,
            tooltipSchemeColor: SchemeColor.inverseSurface,
            tooltipOpacity: 0.9,
            useInputDecoratorThemeInDialogs: true,
            snackBarElevation: 6,
            snackBarBackgroundSchemeColor: SchemeColor.inverseSurface,
            navigationBarSelectedLabelSchemeColor: SchemeColor.onSurface,
            navigationBarUnselectedLabelSchemeColor: SchemeColor.onSurface,
            navigationBarMutedUnselectedLabel: false,
            navigationBarSelectedIconSchemeColor: SchemeColor.onSurface,
            navigationBarUnselectedIconSchemeColor: SchemeColor.onSurface,
            navigationBarMutedUnselectedIcon: false,
            navigationBarIndicatorSchemeColor: SchemeColor.secondaryContainer,
            navigationBarIndicatorOpacity: 1.00,
            navigationRailSelectedLabelSchemeColor: SchemeColor.onSurface,
            navigationRailUnselectedLabelSchemeColor: SchemeColor.onSurface,
            navigationRailMutedUnselectedLabel: false,
            navigationRailSelectedIconSchemeColor: SchemeColor.onSurface,
            navigationRailUnselectedIconSchemeColor: SchemeColor.onSurface,
            navigationRailMutedUnselectedIcon: false,
            navigationRailIndicatorSchemeColor: SchemeColor.secondaryContainer,
            navigationRailIndicatorOpacity: 1.00,
            navigationRailBackgroundSchemeColor: SchemeColor.surface,
            navigationRailLabelType: NavigationRailLabelType.none,
          ),
          keyColors: const FlexKeyColors(
            useSecondary: true,
            useTertiary: true,
            keepPrimary: true,
            keepSecondary: true,
            keepTertiary: true,
          ),
          tones: FlexTones.jolly(Brightness.light),
          visualDensity: FlexColorScheme.comfortablePlatformDensity,
          useMaterial3: true,
          swapLegacyOnMaterial3: true,
          // To use the Playground font, add GoogleFonts package and uncomment
          // fontFamily: GoogleFonts.notoSans().fontFamily,
        ),
        darkTheme: FlexThemeData.dark(
          colors: const FlexSchemeColor(
            primary: Color(0xffdc3535),
            primaryContainer: Color(0xff252a32),
            secondary: Color(0xffd17842),
            secondaryContainer: Color(0xff872100),
            tertiary: Color(0xff0c0f14),
            tertiaryContainer: Color(0xff52555a),
            appBarColor: Color(0xff872100),
            error: Color(0xffcf6679),
          ),
          subThemesData: const FlexSubThemesData(
            interactionEffects: false,
            tintedDisabledControls: false,
            useTextTheme: true,
            inputDecoratorBorderType: FlexInputBorderType.underline,
            inputDecoratorUnfocusedBorderIsColored: false,
            alignedDropdown: true,
            tooltipRadius: 4,
            tooltipSchemeColor: SchemeColor.inverseSurface,
            tooltipOpacity: 0.9,
            useInputDecoratorThemeInDialogs: true,
            snackBarElevation: 6,
            snackBarBackgroundSchemeColor: SchemeColor.inverseSurface,
            navigationBarSelectedLabelSchemeColor: SchemeColor.onSurface,
            navigationBarUnselectedLabelSchemeColor: SchemeColor.onSurface,
            navigationBarMutedUnselectedLabel: false,
            navigationBarSelectedIconSchemeColor: SchemeColor.onSurface,
            navigationBarUnselectedIconSchemeColor: SchemeColor.onSurface,
            navigationBarMutedUnselectedIcon: false,
            navigationBarIndicatorSchemeColor: SchemeColor.secondaryContainer,
            navigationBarIndicatorOpacity: 1.00,
            navigationRailSelectedLabelSchemeColor: SchemeColor.onSurface,
            navigationRailUnselectedLabelSchemeColor: SchemeColor.onSurface,
            navigationRailMutedUnselectedLabel: false,
            navigationRailSelectedIconSchemeColor: SchemeColor.onSurface,
            navigationRailUnselectedIconSchemeColor: SchemeColor.onSurface,
            navigationRailMutedUnselectedIcon: false,
            navigationRailIndicatorSchemeColor: SchemeColor.secondaryContainer,
            navigationRailIndicatorOpacity: 1.00,
            navigationRailBackgroundSchemeColor: SchemeColor.surface,
            navigationRailLabelType: NavigationRailLabelType.none,
          ),
          keyColors: const FlexKeyColors(
            useSecondary: true,
            useTertiary: true,
            keepPrimary: true,
            keepSecondary: true,
            keepTertiary: true,
          ),
          tones: FlexTones.jolly(Brightness.dark),
          visualDensity: FlexColorScheme.comfortablePlatformDensity,
          useMaterial3: true,
          swapLegacyOnMaterial3: true,
          // To use the Playground font, add GoogleFonts package and uncomment
          // fontFamily: GoogleFonts.notoSans().fontFamily,
        ),
        // If you do not have a themeMode switch, uncomment this line
        // to let the device system mode control the theme mode:
        // themeMode: ThemeMode.system,
        routerConfig: AppRouter.router,

        // home: MultiBlocProvider(
        //   providers: [
        //     BlocProvider(
        //       create: (_) => getIt<CarouselImagesBloc>(),
        //     ),
        //     BlocProvider(
        //       create: (_) =>getIt< BioCardBloc>(),
        //     ),
        //   ],
        //   child: const HomeScreen(),
        // ),
      ),
    );
  }
}
