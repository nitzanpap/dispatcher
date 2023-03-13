import 'package:flutter/services.dart';

abstract class DeviceConfigFunctions {
  static void ensureDeviceOrientation() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
}
