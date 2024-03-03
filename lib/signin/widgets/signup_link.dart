import 'package:assesment_test/signup/signup_screen.dart';
import 'package:assesment_test/utils/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignupLink extends StatelessWidget {
  const SignupLink({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: "Don’t have an account? ",
        style: const TextStyle(
          color: AppColors.grey500,
          fontSize: 16,
        ),
        children: [
          TextSpan(
            text: "Sign Up",
            style: TextStyle(
              color: AppColors.primary,
          fontSize: 16,
          fontWeight: FontWeight.w600,
                ),
            recognizer: TapGestureRecognizer()..onTap = () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const SignupScreen(),
                )
              );
            },
          ),
        ],
      ),
    );
  }
}
