part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const splash = _Paths.splash;
  static const login = _Paths.login;
  static const home = _Paths.home;
  static const postservice = _Paths.postservice;
  static const postserviceSearch = _Paths.postserviceSearch;
  static const postservicedetail = _Paths.postservicedetail;
  static const subscriptionPage = _Paths.subscriptionPage;
  static const forgotPasswordPage = _Paths.forgotPasswordPage;
}

abstract class _Paths {
  static const splash = '/splash';
  static const login = '/login';
  static const forgotPasswordPage = '/forgotPasswordPage';
  static const home = '/home';
  static const postservice = '/postservice';
  static const postserviceSearch = '/postserviceSearch';
  static const postservicedetail = '/postservicedetail';
  static const subscriptionPage = '/subscriptionPage';
  static const editProfilePage = '/editProfilePage';
  static const changePasswordPage = '/changePasswordPage';
  static const addPostPage = '/addPostPage';
}
