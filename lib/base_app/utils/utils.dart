import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

export 'package:flutter_screenutil/flutter_screenutil.dart';
export 'package:flutter_svg/flutter_svg.dart';
export 'package:go_router/go_router.dart';

class AppUtils {
  static pushAndRemoveUntil(BuildContext context, String route) {
    while (context.canPop()) {
      context.pop();
    }
    context.pushReplacement(route);
  }
}
