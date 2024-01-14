import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class CarServicesFingerprintLock {
  // Singleton instance
  static final CarServicesFingerprintLock _instance =
      CarServicesFingerprintLock._internal();

  // Factory constructor
  factory CarServicesFingerprintLock() {
    return _instance;
  }

  // Internal constructor
  CarServicesFingerprintLock._internal();

  final LocalAuthentication auth = LocalAuthentication();

  Future<bool> authenticate() async {
    bool canAuthenticateWithBiometrics = false;
    bool authenticated = false;

    try {
      canAuthenticateWithBiometrics = await auth.canCheckBiometrics;

      if (canAuthenticateWithBiometrics) {
        authenticated = await auth.authenticate(
          localizedReason: 'Please authenticate to access this feature',
          // useErrorDialogs: true,
          // stickyAuth: true,
        );
      }
    } on PlatformException catch (e) {
      print(e);
    }

    return authenticated;
  }
}
