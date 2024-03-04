import 'package:assesment_test/signup/widgets/signin_link.dart';
import 'package:assesment_test/utils/colors.dart';
import 'package:assesment_test/utils/constants.dart';
import 'package:assesment_test/utils/form_validators.dart';
import 'package:assesment_test/widgets/alternative_auth.dart';
import 'package:assesment_test/widgets/app_elevated_button.dart';
import 'package:assesment_test/widgets/app_input_field.dart';
import 'package:assesment_test/widgets/app_text.dart';
import 'package:flutter/material.dart';

class SignupEmail extends StatelessWidget {
  const SignupEmail({
    super.key,
    required this.emailTextCtrl,
    required this.formKey,
    required this.gotoNextPage,
  });

  final TextEditingController emailTextCtrl;
  final GlobalKey<FormState> formKey;
  final VoidCallback gotoNextPage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppConstants.generalPadding),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            RichText(
              text: const TextSpan(
                text: "Create a ",
                style: TextStyle(
                  color: AppColors.grey900,
                  fontSize: 24,
                  fontWeight: FontWeight.w600
                ),
                children: [
                  TextSpan(
                    text: "Smartpay",
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 24,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                  TextSpan(
                    text: "\naccount",
                    style: TextStyle(
                      color: AppColors.grey900,
                      fontSize: 24,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            AppInputField(
              hintText: 'Email',
              keyboardType: TextInputType.emailAddress,
              validator: AppFormValidator.validateEmail,
              controller: emailTextCtrl,
            ),
            const SizedBox(
              height: 35,
            ),
            AppElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  gotoNextPage();
                }
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 16,
                ),
                child: Center(
                  child: AppText(
                    'Sign Up',
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
            const SizedBox(
              height: 75,
            ),
            const SigninLink()
          ],
        ),
      ),
    );
  }
}
