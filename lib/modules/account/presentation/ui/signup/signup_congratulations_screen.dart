import 'package:smartpay/base_app/router/route_name.dart';
import 'package:smartpay/base_app/utils/constants.dart';
import 'package:smartpay/base_app/view/dashbaord/dashboard_screen.dart';
import 'package:smartpay/base_app/utils/colors.dart';
import 'package:smartpay/base_app/view/widgets/app_elevated_button.dart';
import 'package:smartpay/base_app/view/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignupCongratulationsScreen extends StatelessWidget {
  const SignupCongratulationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(AppConstants.generalPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              'assets/images/thumbs_up.png',
              width: 140,
            ),
            const SizedBox(
              height: 20,
            ),
            const AppText(
              'Congratulations, James',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: AppColors.grey900,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 16,
            ),
            const AppText(
              'You’ve completed the onboarding,\nyou can start using',
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 40,
            ),
            AppElevatedButton(
              onPressed: () {
                context.pushReplacement(AppRoutes.dashboardRoute);
              },
              child: const Center(
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: AppText('Get Started',
                      style: TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
