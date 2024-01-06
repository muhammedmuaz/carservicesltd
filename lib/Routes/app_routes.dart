part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const splash = _Paths.splash;
  static const login = _Paths.login;
  static const home = _Paths.home;
  static const postservice = _Paths.postservice;
  static const postservicedetail = _Paths.postservicedetail;
  static const subscriptionPage = _Paths.subscriptionPage;
}

abstract class _Paths {
  static const splash = '/splash';
  static const login = '/login';
  static const home = '/home';
  static const postservice = '/postservice';
  static const postservicedetail = '/postservicedetail';
  static const subscriptionPage = '/subscriptionPage';
  static const editProfilePage = '/editProfilePage';
  static const changePasswordPage = '/changePasswordPage';
  static const addPostPage = '/addPostPage';
}
