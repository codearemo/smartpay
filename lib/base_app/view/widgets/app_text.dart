import 'package:smartpay/base_app/utils/colors.dart';
import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;

  const AppText(
    this.text, {
    Key? key,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style ?? const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColors.grey500,
      ),
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
    );
  }
}