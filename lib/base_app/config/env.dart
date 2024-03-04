import 'package:assesment_test/base_app/core/abstractions/build_config.dart';
import 'package:flutter/foundation.dart';

class Env {
  static final BuildConfig _dev = BuildConfig(
    baseUrl: 'https://mobile-test-2d7e555a4f85.herokuapp.com/api/v1/',
    appName: "Smartpay Staging",
  );
  static final BuildConfig _prod = BuildConfig(
    baseUrl: 'https://mobile-test-2d7e555a4f85.herokuapp.com/api/v1/',
    appName: "Smartpay",
  );

  static BuildConfig get getConfig => kReleaseMode ? _prod : _dev;
}
