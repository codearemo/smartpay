import 'package:smartpay/base_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({
    super.key,
    this.onTap,
  });

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap == null ?
          () {
            FocusScope.of(context).requestFocus(FocusNode());
            context.pop();
          } :() {
            FocusScope.of(context).requestFocus(FocusNode());
            onTap!();
          },
      child: Container(
        margin: const EdgeInsets.all(10.0),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.grey200,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Image.asset(
          'assets/icons/chevron_down.png',
          color: AppColors.grey900,
        ),
      ),
    );
  }
}
