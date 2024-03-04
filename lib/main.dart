import 'package:assesment_test/base_app/config/app_start.dart';
import 'package:assesment_test/base_app/config/env.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  InitializeApp().startApp();
}

class InitializeApp extends AppStart {
  InitializeApp() : super(Env.getConfig);
}