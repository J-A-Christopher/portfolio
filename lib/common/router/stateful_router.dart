import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/common/router/nav_bar_impl.dart';
import 'package:portfolio/common/util/home_screen.dart';
import 'package:portfolio/features/blogs/presentation/bloc/screens/blog_screen.dart';
import 'package:portfolio/features/contacts/presentation/screens/contact_screen.dart';
import 'package:portfolio/features/experiences/presentation/screens/experiences_screen.dart';
import 'package:portfolio/features/imageCarousel/domain/entities/image_domain_entity.dart';
import 'package:portfolio/features/mage_detail.dart';
import 'package:portfolio/features/news/presentation/screens/news_screen.dart';
import 'package:portfolio/features/notifications/presentations/screens/notifications_screen.dart';
import 'package:portfolio/features/projects/presentation/screens/projects_screen.dart';
import 'package:portfolio/features/resume/presentation/screens/resume_screen.dart';
import 'package:portfolio/features/services/presentation/screens/services_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _homeNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'Home');
final _newsNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'News');
final _notificationsNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'Notifications');

final goRouter =
    GoRouter(initialLocation: '/', navigatorKey: _rootNavigatorKey, routes: [
  StatefulShellRoute.indexedStack(
      builder: ((context, state, navigationShell) {
        return ScaffoldWithNestedNavigation(navigationShell: navigationShell);
      }),
      branches: [
        StatefulShellBranch(navigatorKey: _homeNavigatorKey, routes: [
          GoRoute(
              path: '/',
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: HomeScreen()),
              routes: [
                GoRoute(
                    path: 'experiences',
                    builder: ((context, state) => const Experiences()),
                    routes: [
                      GoRoute(
                          path: 'image-detail',
                          builder: (context, state) => ImageDetail(
                                image: state.extra as CarouselImageEntity,
                              ))
                    ]),
                GoRoute(
                    path: 'contact',
                    builder: (context, state) => Contact(
                        // description: state.extra as String,
                        )),
                GoRoute(
                    path: 'blog-screen',
                    builder: (context, state) => const BlogsScreen()),
                GoRoute(
                    path: 'portfolio-screen',
                    builder: (context, state) => const ProjectsScreen()),
                GoRoute(
                    path: 'resume-screen',
                    builder: (context, state) => const ResumeScreen()),
                GoRoute(
                    path: 'services',
                    builder: (context, state) => const ServicesScreen(),
                    routes: [
                      GoRoute(
                          path: 'contact',
                          builder: (context, state) => Contact(
                              //description: description
                              ))
                    ])
              ])
        ]),
        StatefulShellBranch(navigatorKey: _newsNavigatorKey, routes: [
          GoRoute(
              path: '/news-screen',
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: NewsScreen())),
        ]),
        StatefulShellBranch(navigatorKey: _notificationsNavigatorKey, routes: [
          GoRoute(
              path: '/notifications-screen',
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: NotificationsScreen())),
        ])
      ])
]);
