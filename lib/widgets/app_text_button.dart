// ignore_for_file: unnecessary_null_comparison

import 'package:assesment_test/utils/colors.dart';
import 'package:flutter/material.dart';

class AppTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final TextStyle textStyle;
  final Color? backgroundColor;
  final double borderRadius;
  final EdgeInsets padding;

  const AppTextButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.textStyle = const TextStyle(color: Colors.white, fontSize: 16),
    this.backgroundColor,
    this.borderRadius = 8,
    this.padding = const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed == null ? null : () {
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
          text,
          style: textStyle.copyWith(
            color: AppColors.primary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
