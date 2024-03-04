import 'package:assesment_test/dashbaord/dashboard_screen.dart';
import 'package:assesment_test/forgot_password/forgot_password.dart';
import 'package:assesment_test/signin/widgets/signup_link.dart';
import 'package:assesment_test/utils/form_validators.dart';
import 'package:assesment_test/widgets/alternative_auth.dart';
import 'package:assesment_test/utils/colors.dart';
import 'package:assesment_test/utils/constants.dart';
import 'package:assesment_test/widgets/app_elevated_button.dart';
import 'package:assesment_test/widgets/app_input_field.dart';
import 'package:assesment_test/widgets/app_text.dart';
import 'package:assesment_test/widgets/app_text_button.dart';
import 'package:assesment_test/widgets/back_button.dart';
import 'package:flutter/material.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final _formKey = GlobalKey<FormState>();

  final emailTextCtrl = TextEditingController();
  final passwordTextCtrl = TextEditingController();

  @override
  void dispose() {
    emailTextCtrl.dispose();
    passwordTextCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButton(),
      ),
      bottomNavigationBar: const Padding(
        padding: EdgeInsets.only(
          bottom: 30,
        ),
        child: SignupLink(),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(AppConstants.generalPadding),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const AppText(
                    'Hi There! 👋',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const AppText(
                    'Welcome back, Sign in to your account',
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                   AppInputField(
                    hintText: 'Email',
                    keyboardType: TextInputType.emailAddress,
                    validator: AppFormValidator.validateEmail,
                    controller: emailTextCtrl,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                   AppInputField(
                    validator: AppFormValidator.validatePassword,
                    hintText: 'Password',
                    obscureText: true,
                    controller: passwordTextCtrl,
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  Row(
                    children: [
                      AppTextButton(
                        onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ForgotPasswordScreen(),
                              ),
                            );
                        },
                        text: 'Forgot Password?',
                        padding: const EdgeInsets.all(0),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  AppElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState?.save();
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => const DashboardScreen()),
                          (route) => false);
                      }
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 16,
                      ),
                      child: Center(
                        child: AppText(
                          'Sign In',
                          style: TextStyle(
                            color: AppColors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const AlternativeAuth(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
