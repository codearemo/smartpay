import 'package:assesment_test/utils/colors.dart';
import 'package:assesment_test/widgets/app_input_field.dart';
import 'package:assesment_test/widgets/app_text.dart';
import 'package:flutter/material.dart';

class EnterEmailForPasswordRecovery extends StatelessWidget {
  const EnterEmailForPasswordRecovery({
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
                'assets/images/password_recovery_icon.png',
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        const AppText(
          'Passsword Recovery',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: AppColors.grey900,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const AppText(
          'Enter your registered email below to receive password instructions',
        ),
        const SizedBox(
          height: 35,
        ),
        const AppInputField(
          hintText: 'Email',
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(
          height: 25,
        ),
      ],
    );
  }
}
