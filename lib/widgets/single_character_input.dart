import 'package:assesment_test/utils/colors.dart';
import 'package:assesment_test/widgets/app_text.dart';
import 'package:assesment_test/widgets/input_hash.dart';
import 'package:flutter/material.dart';

class SingleCharaterInput extends StatelessWidget {
  const SingleCharaterInput({
    super.key,
    required this.character,
    this.isActive = false,
    this.encrypted = false,
  });

  final String? character;
  final bool isActive;
  final bool encrypted;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: character == '' ? 22 : 16,
        vertical: 8,
      ),
      decoration: encrypted
          ? const BoxDecoration(
              border: Border(
                  bottom: BorderSide(
              color: AppColors.primary,
              width: 2,
            )))
          : BoxDecoration(
              color: AppColors.grey50,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isActive ? AppColors.primary : AppColors.transparent,
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
