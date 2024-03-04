import 'package:assesment_test/base_app/utils/colors.dart';
import 'package:assesment_test/base_app/view/widgets/app_text.dart';
import 'package:flutter/material.dart';

class AlternativeAuth extends StatelessWidget {
  const AlternativeAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                height: 1.5,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      AppColors.grey200.withOpacity(0.1),
                      AppColors.grey200,
                    ],
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: AppText(
                'OR',
              ),
            ),
            Expanded(
              child: Container(
                height: 1.5,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    colors: [
                      AppColors.grey200.withOpacity(0.1),
                      AppColors.grey200,
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Expanded(
              child: AlternateLoginButton(
                child: Image.asset(
                  'assets/images/google_icon.png',
                ),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: AlternateLoginButton(
                child: Image.asset(
                  'assets/images/apple_icon.png',
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class AlternateLoginButton extends StatelessWidget {
  const AlternateLoginButton({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 12,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.grey200,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: SizedBox(
          height: 23,
          child: child,
        ),
      ),
    );
  }
}
