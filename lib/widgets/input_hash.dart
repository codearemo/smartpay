import 'package:assesment_test/utils/colors.dart';
import 'package:flutter/material.dart';

class AppInputHash extends StatelessWidget {
  const AppInputHash({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 10,
      ),
      padding: const EdgeInsets.all(6),
        decoration: const BoxDecoration(
          color: AppColors.grey900,
          shape: BoxShape.circle,
        )
      );
  }
}