class AppPaths {
  // ---------- Core Screens ----------
  static const String welcome = '/welcome';

  // ---------- Authentication ----------
  static const String signIn = '/sign_in';
  static const String signUp = '/sign_up';
  static const String forgotPassword = '/forgot_password';
  static const String resetPassword = '/reset_password';
  static const String passwordChanged = '/password_changed';



  // ---------- Dashboard / Tabs ----------
  static const String dashboard = '/dashboard';
  static const String home = '/home';
  static const String profile = '/profile';
  static const String settings = '/settings';
  static const String editProfile = '/edit_profile';
  static const String notifications = '/notifications';

  // ---------- Utilities ----------
  static const String instant = '/instant';
  static const String notFound = '/404';
}

 /*
🧭 How to Use It
Now instead of doing this (bad practice):
NavigationServices.go('/home');

You’ll do this (best practice):
NavigationServices.go(AppPaths.home);

Same everywhere:
NavigationServices.push(AppPaths.login);
NavigationServices.replace(AppPaths.splash);
 */