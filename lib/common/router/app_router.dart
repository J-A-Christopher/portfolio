import 'package:go_router/go_router.dart';
import 'package:portfolio/features/blogs/presentation/bloc/screens/blog_screen.dart';
import 'package:portfolio/features/contacts/presentation/screens/contact_screen.dart';
import 'package:portfolio/features/experiences/presentation/screens/experiences_screen.dart';
import 'package:portfolio/features/imageCarousel/domain/entities/image_domain_entity.dart';
import 'package:portfolio/features/mage_detail.dart';
import 'package:portfolio/features/projects/presentation/screens/projects_screen.dart';
import 'package:portfolio/features/resume/presentation/screens/resume_screen.dart';
import 'package:portfolio/features/services/presentation/screens/services_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(routes: [
    //GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
    //NavBarWidget
    //GoRoute(path: '/', builder: (context, state) => const NavBarWidget()),
    // GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
    GoRoute(
        path: '/experiences',
        builder: ((context, state) => const Experiences()),
        routes: [
          GoRoute(
              path: 'image-detail',
              builder: (context, state) => ImageDetail(
                    image: state.extra as CarouselImageEntity,
                  ))
        ]),
    GoRoute(
        path: '/contact',
        builder: (context, state) => Contact(
            // description: state.extra as String,
            )),
    GoRoute(
        path: '/blog-screen', builder: (context, state) => const BlogsScreen()),
    GoRoute(
        path: '/portfolio-screen',
        builder: (context, state) => const ProjectsScreen()),
    GoRoute(
        path: '/resume-screen',
        builder: (context, state) => const ResumeScreen()),
    GoRoute(
        path: '/services',
        builder: (context, state) => const ServicesScreen(),
        routes: [
          GoRoute(
              path: 'contact',
              builder: (context, state) => Contact(
                  
                  ))
        ])
  ]);
}
