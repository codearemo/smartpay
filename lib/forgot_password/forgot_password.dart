import 'package:assesment_test/forgot_password/create_new_password_screen.dart';
import 'package:assesment_test/forgot_password/widgets/enter_email.dart';
import 'package:assesment_test/forgot_password/widgets/verified_email.dart';
import 'package:assesment_test/utils/colors.dart';
import 'package:assesment_test/utils/constants.dart';
import 'package:assesment_test/widgets/app_elevated_button.dart';
import 'package:assesment_test/widgets/app_text.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailTextCtrl = TextEditingController();

  bool emailVerified = false;
  final Duration _revealDuration = const Duration(milliseconds: 300);

  void verifyEmail() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        emailVerified = true;
      });
    }
  }

  void gotoCreateNewPassword() {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => const NewPasswordScreen()));
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    emailTextCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(AppConstants.generalPadding),
        child: AppElevatedButton(
          onPressed: emailVerified ? gotoCreateNewPassword : verifyEmail,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 16,
            ),
            child: AppText(
              emailVerified ? 'Continue' : 'Send me email',
              style: const TextStyle(
                color: AppColors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(AppConstants.generalPadding),
            child: Stack(
              children: [
                AnimatedOpacity(
                  duration: _revealDuration,
                  opacity: emailVerified ? 1.0 : 0.0,
                  child: const VerifiedEmail(),
                ),
                AnimatedOpacity(
                  duration: _revealDuration,
                  opacity: emailVerified ? 0.0 : 1.0,
                  child: SingleChildScrollView(
                    child: EnterEmailForPasswordRecovery(
                      emailTextCtrl: emailTextCtrl,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
