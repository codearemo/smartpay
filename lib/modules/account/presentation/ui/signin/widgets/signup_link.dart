import 'package:assesment_test/base_app/router/route_name.dart';
import 'package:assesment_test/base_app/utils/colors.dart';
import 'package:assesment_test/modules/account/presentation/ui/signup/signup_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
            style: const TextStyle(
              color: AppColors.primary,
          fontSize: 16,
          fontWeight: FontWeight.w600,
                ),
            recognizer: TapGestureRecognizer()..onTap = () {
              context.pushReplacement(AppRoutes.signupRoute);
            },
          ),
        ],
      ),
    );
  }
}
