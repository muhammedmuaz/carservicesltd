part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const splash = _Paths.splash;
  static const login = _Paths.login;
  static const home = _Paths.home;
  static const postservice = _Paths.postservice;
  static const postservicedetail = _Paths.postservicedetail;
  static const createanAdd = _Paths.createanAdd;
  static const subscriptionpage = _Paths.subscriptionpage;
}

abstract class _Paths {
  static const splash = '/splash';
  static const login = '/login';
  static const home = '/home';
  static const postservice = '/postservice';
  static const postservicedetail = '/postservicedetail';
  static const createanAdd = '/createanAdd';
  static const profilepage = '/profilepage';
  static const subscriptionpage = '/subscriptionpage';
}
