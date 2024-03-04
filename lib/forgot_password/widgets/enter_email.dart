import 'package:assesment_test/utils/colors.dart';
import 'package:assesment_test/utils/form_validators.dart';
import 'package:assesment_test/widgets/app_input_field.dart';
import 'package:assesment_test/widgets/app_text.dart';
import 'package:flutter/material.dart';

class EnterEmailForPasswordRecovery extends StatefulWidget {
  const EnterEmailForPasswordRecovery({
    super.key,
    required this.emailTextCtrl,
  });

  final TextEditingController emailTextCtrl;

  @override
  State<EnterEmailForPasswordRecovery> createState() => _EnterEmailForPasswordRecoveryState();
}

class _EnterEmailForPasswordRecoveryState extends State<EnterEmailForPasswordRecovery> {
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
        AppInputField(
          hintText: 'Email',
          keyboardType: TextInputType.emailAddress,
          validator: AppFormValidator.validateEmail,
          controller: widget.emailTextCtrl,
        ),
        const SizedBox(
          height: 25,
        ),
      ],
    );
  }
}
