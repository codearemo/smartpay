import 'package:smartpay/base_app/utils/colors.dart';
import 'package:smartpay/base_app/utils/constants.dart';
import 'package:smartpay/base_app/view/widgets/app_elevated_button.dart';
import 'package:smartpay/base_app/view/widgets/app_input_field.dart';
import 'package:smartpay/base_app/view/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(AppConstants.generalPadding),
        child: AppElevatedButton(
          onPressed: () {
            context.pop();
          },
          child: const Padding(
            padding: EdgeInsets.symmetric(
              vertical: 16,
            ),
            child: AppText(
              'Create new password',
              style: TextStyle(
                color: AppColors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.all(AppConstants.generalPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 20,
              ),
              AppText(
                'Create New Password',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: AppColors.grey900,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              AppText(
                'Please, enter a new password below different from the previous password',
              ),
              SizedBox(
                height: 35,
              ),
              AppInputField(
                hintText: 'Password',
                obscureText: true,
              ),
              SizedBox(
                height: 15,
              ),
              AppInputField(
                hintText: 'Confirm Password',
                obscureText: true,
              ),
              SizedBox(
                height: 25,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
