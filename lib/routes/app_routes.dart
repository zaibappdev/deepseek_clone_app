import 'package:go_router/go_router.dart';
import 'app_paths.dart';
import 'navigation_services.dart';

class AppRoutes {
  static final GoRouter router = GoRouter(
    navigatorKey: NavigationServices.navigatorKey,
    initialLocation: AppPaths.welcome,
    routes: [
      // GoRoute(
      //   path: AppPaths.welcome,
      //   pageBuilder: (context, state) =>
      //       NavigationServices.instant(const WelcomeScreen(), state),
      // ),
    ],
  );
}

/*
      // GoRoute(
      //   path: AppPaths.splash,
      //   pageBuilder: (context, state) =>
      //       NavigationServices.fade(const SplashScreen(), state),
      // ),

      // GoRoute(
      //   path: AppPaths.home,
      //   pageBuilder: (context, state) =>
      //       NavigationServices.slideFromRight(const HomeScreen(), state),
      // ),

      // GoRoute(
      //   path: AppPaths.login,
      //   pageBuilder: (context, state) =>
      //       NavigationServices.slideFromBottom(const LoginScreen(), state),
      // ),

      // GoRoute(
      //   path: AppPaths.instant,
      //   pageBuilder: (context, state) =>
      //       NavigationServices.instant(const InstantScreen(), state),
      // ),
 */
