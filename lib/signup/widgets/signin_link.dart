import 'package:assesment_test/signin/signin_screen.dart';
import 'package:assesment_test/utils/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SigninLink extends StatelessWidget {
  const SigninLink({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: "Already have an account? ",
        style: const TextStyle(
          color: AppColors.grey500,
          fontSize: 16,
        ),
        children: [
          TextSpan(
            text: "Sign In",
            style: TextStyle(
              color: AppColors.primary,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            recognizer: TapGestureRecognizer()..onTap = () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const SigninScreen(),
                )
              );
            },
          ),
        ],
      ),
    );
  }
}