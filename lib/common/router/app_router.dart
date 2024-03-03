import 'package:go_router/go_router.dart';
import 'package:portfolio/common/util/home_screen.dart';
import 'package:portfolio/features/contacts/presentation/screens/contact_screen.dart';
import 'package:portfolio/features/experiences/presentation/screens/experiences_screen.dart';
import 'package:portfolio/features/imageCarousel/domain/entities/image_domain_entity.dart';
import 'package:portfolio/features/mage_detail.dart';

class AppRouter {
  static final GoRouter router = GoRouter(routes: [
    GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
    GoRoute(
        path: '/experiences',
        builder: ((context, state) => const Experiences()),
        routes: [
          GoRoute(
              path: 'image-detail',
              builder: (context, state) =>  ImageDetail(image: state.extra as CarouselImageEntity,))
        ]),
    GoRoute(
        path: '/contact',
        builder: (context, state) => Contact(
              description: state.extra as String,
            )),
  ]);
}
