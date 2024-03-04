import 'package:assesment_test/base_app/utils/colors.dart';
import 'package:assesment_test/base_app/view/widgets/app_text.dart';
import 'package:flutter/material.dart';

class SingleCharaterInput extends StatelessWidget {
  const SingleCharaterInput({
    super.key,
    required this.character,
    this.isActive = false,
    this.encrypted = false,
    this.inValidCode = false,
  });

  final String? character;
  final bool isActive;
  final bool encrypted;
  final bool inValidCode;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: character == '' ? 22 : 16,
        vertical: 8,
      ),
      decoration: encrypted
          ?  BoxDecoration(
              border: Border(
                  bottom: BorderSide(
              color: inValidCode ? AppColors.error : AppColors.primary,
              width: 2,
            )))
          : BoxDecoration(
              color: AppColors.grey50,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: inValidCode ? AppColors.error : isActive ? AppColors.primary : AppColors.transparent,
              ),
            ),
      child: Center(
        child: AppText(
          encrypted
              ? '$character'.isNotEmpty
                  ? '\u{25CF}'
                  : ''
              : '$character',
          style: const TextStyle(
            color: AppColors.grey900,
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
