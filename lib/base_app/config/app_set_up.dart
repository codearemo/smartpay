import 'package:assesment_test/base_app/core/storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSetUp {
  Future init() async {
    WidgetsFlutterBinding.ensureInitialized();

    await ScreenUtil.ensureScreenSize();

    await SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  }

  Future initStorage(Storage storage) async {
    await storage.initStorage();
  }
}
