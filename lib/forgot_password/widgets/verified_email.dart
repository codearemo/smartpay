import 'package:assesment_test/utils/colors.dart';
import 'package:assesment_test/widgets/app_text.dart';
import 'package:flutter/material.dart';

class VerifiedEmail extends StatelessWidget {
  const VerifiedEmail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            SizedBox(
              height: 100,
              child: Image.asset(
                'assets/images/verify_email_logo.png',
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        const AppText(
          'Verify your identity',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: AppColors.grey900,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        RichText(
          text: const TextSpan(
            text: "Where would you like ",
            style: TextStyle(
              color: AppColors.grey500,
              fontSize: 16,
            ),
            children: [
              TextSpan(
                text: "Smartpay",
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextSpan(
                text: " to send your security code?",
                style: TextStyle(
                  color: AppColors.grey500,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 35,
        ),
        ListTile(
          tileColor: AppColors.grey50,
          contentPadding: const EdgeInsets.all(16),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          leading: Image.asset(
            'assets/images/check_circle.png',
            width: 20,
          ),
          title: const AppText('Email',
              style: TextStyle(
                color: AppColors.grey900,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              )),
          subtitle: const AppText(
            'A*******@mail.com',
            style: TextStyle(
              color: AppColors.grey500,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          trailing: Image.asset(
            'assets/icons/mail.png',
            width: 24,
          ),
        ),
      ],
    );
  }
}
