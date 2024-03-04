import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/widgets.dart';

class AppAlerts {
  static showAlert(
    String message,
    BuildContext context, {
    AnimatedSnackBarType type = AnimatedSnackBarType.success,
  }) {
    AnimatedSnackBar.material(
      message,
      type: type,
    ).show(context);
  }
}
