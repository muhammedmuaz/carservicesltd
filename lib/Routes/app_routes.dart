part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const splash = _Paths.splash;
  static const login = _Paths.login;
  static const home = _Paths.home;
  static const postservice = _Paths.postservice;
  static const postservicedetail = _Paths.postservicedetail;
}

abstract class _Paths {
  static const splash = '/splash';
  static const login = '/login';
  static const home = '/home';
  static const postservice = '/postservice';
  static const postservicedetail = '/postservicedetail';
}
