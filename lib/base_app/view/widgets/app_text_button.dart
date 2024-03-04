import 'package:assesment_test/base_app/utils/colors.dart';
import 'package:assesment_test/base_app/utils/loaders.dart';
import 'package:flutter/material.dart';

class AppTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final TextStyle textStyle;
  final Color? backgroundColor;
  final double borderRadius;
  final EdgeInsets padding;
  final bool loading;
  final bool disabled;

  const AppTextButton({
    super.key,
    required this.onPressed,
    this.loading = false,
    this.disabled = false,
    required this.text,
    this.textStyle = const TextStyle(color: Colors.white, fontSize: 16),
    this.backgroundColor,
    this.borderRadius = 8,
    this.padding = const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: disabled ? null : onPressed == null ? null : () {
        FocusScope.of(context).requestFocus(FocusNode());
        onPressed();
      },
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        padding: padding,
        child: Text(
         loading ? AppLoaders.textLoader : text,
          style: textStyle.copyWith(
            color: disabled ? AppColors.grey500 : AppColors.primary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
