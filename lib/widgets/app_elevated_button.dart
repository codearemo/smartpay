import 'package:assesment_test/utils/colors.dart';
import 'package:flutter/material.dart';

class AppElevatedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;

  const AppElevatedButton({super.key, required this.onPressed, required this.child});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed == null ? null : () {
        FocusScope.of(context).requestFocus(FocusNode());
        onPressed!();
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: AppColors.white, backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16), // Border radius
        ),
      ),
      child: child,
    );
  }
}