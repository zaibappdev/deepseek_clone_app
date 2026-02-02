import 'package:deepseek_clone_app/features/home/home_screen.dart';
import 'package:deepseek_clone_app/features/setting/setting_screen.dart';
import 'package:go_router/go_router.dart';
import '../features/authentication/reset_password/reset_password_screen.dart';
import '../features/authentication/sign_in/sign_in_screen.dart';
import '../features/authentication/sign_up/sign_up_screen.dart';
import '../features/authentication/welcome/welcome_screen.dart';
import 'app_paths.dart';
import 'navigation_services.dart';

class AppRoutes {
  static final GoRouter router = GoRouter(
    navigatorKey: NavigationServices.navigatorKey,
    initialLocation: AppPaths.welcome,
    routes: [
      GoRoute(
        path: AppPaths.welcome,
        pageBuilder: (context, state) =>
            NavigationServices.slideFromRight(const WelcomeScreen(), state),
      ),

      GoRoute(
        path: AppPaths.signIn,
        pageBuilder: (context, state) =>
            NavigationServices.slideFromRight(const SignInScreen(), state),
      ),

      GoRoute(
        path: AppPaths.signUp,
        pageBuilder: (context, state) =>
            NavigationServices.slideFromRight(const SignUpScreen(), state),
      ),

      GoRoute(
        path: AppPaths.home,
        pageBuilder: (context, state) =>
            NavigationServices.slideFromRight(const HomeScreen(), state),
      ),

      GoRoute(
        path: AppPaths.settings,
        pageBuilder: (context, state) =>
            NavigationServices.slideFromRight(const SettingScreen(), state),
      ),

      GoRoute(
        path: AppPaths.resetPassword,
        pageBuilder: (context, state) =>
            NavigationServices.slideFromRight(const ResetPasswordScreen(), state),
      ),
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
