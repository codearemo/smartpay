import 'package:smartpay/base_app/utils/colors.dart';
import 'package:smartpay/base_app/utils/loaders.dart';
import 'package:flutter/material.dart';

class AppElevatedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final bool loading;
  final bool disabled;

  const AppElevatedButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.loading = false,
    this.disabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: disabled
          ? null
          : onPressed == null
              ? null
              : () {
                  FocusScope.of(context).requestFocus(FocusNode());
                  onPressed!();
                },
      style: ElevatedButton.styleFrom(
        foregroundColor: AppColors.white,
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16), // Border radius
        ),
        disabledBackgroundColor: AppColors.grey900.withOpacity(0.7),
      ),
      child: loading
          ? Container(
          padding: const EdgeInsets.all(8.0),
          margin: const EdgeInsets.all(8.0),
            width: 35,
            height: 35,
            child: AppLoaders.circularProgress,
          )
          : child,
    );
  }
}
