import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/common/util/app_global_bloc_observer.dart';
import 'package:portfolio/di/di.dart';
import 'package:portfolio/features/imageCarousel/presentation/bloc/carousel_images_bloc.dart';
import 'package:portfolio/common/util/home_screen.dart';

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
      theme: FlexThemeData.light(scheme: FlexScheme.ebonyClay),
      darkTheme: FlexThemeData.dark(scheme: FlexScheme.ebonyClay),
      home: BlocProvider(
        create: (_) => getIt<CarouselImagesBloc>(),
        child: const HomeScreen(),
      ),
    );
  }
}
