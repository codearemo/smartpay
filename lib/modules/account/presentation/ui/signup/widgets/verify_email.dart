import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:assesment_test/base_app/utils/colors.dart';
import 'package:assesment_test/base_app/view/widgets/app_alert.dart';
import 'package:assesment_test/base_app/view/widgets/app_text.dart';
import 'package:assesment_test/base_app/view/widgets/counter_down_timer.dart';
import 'package:assesment_test/base_app/view/widgets/keypad/number_keypad.dart';
import 'package:assesment_test/base_app/view/widgets/single_character_input.dart';
import 'package:assesment_test/modules/account/entities/verify_email_entity.dart';
import 'package:assesment_test/modules/account/presentation/state/account_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({
    super.key,
    required this.gotoNextPage,
    required this.codeTextCtrl,
    required this.emailTextCtrl,
  });

  final VoidCallback gotoNextPage;
  final TextEditingController codeTextCtrl;
  final TextEditingController emailTextCtrl;

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  final code = TextEditingController();
  final int codeLength = 5;

  void addCharacter(String character) {
    if (code.text.length < codeLength) {
      setState(() {
        code.text += character;
      });
    }
  }

  void removeCharacter() {
    if (code.text.isNotEmpty) {
      setState(() {
        code.text = code.text.substring(0, code.text.length - 1);
      });
    }
  }

  void triggerVerifyEmail() async {
    final AccountCubit accountCubit = context.read<AccountCubit>();

    final VerifyEmailEntity verificationEntity = VerifyEmailEntity(
      email: widget.emailTextCtrl.text.trim(),
      token: code.text.trim(),
    );

    await accountCubit.verifyEmail(
      verificationEntity,
    );

    if (mounted) {
      if (accountCubit.state.error == null) {
        widget.codeTextCtrl.text = code.text;
        widget.gotoNextPage();
      } else {
        AppAlerts.showAlert(accountCubit.state.error.toString(), context,
            type: AnimatedSnackBarType.error);
      }
    }
  }

  @override
  void initState() {
    super.initState();

    code.text = widget.codeTextCtrl.text;
  }

  @override
  void dispose() {
    code.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AccountCubit accountCubit = context.watch<AccountCubit>();
    final String email = widget.emailTextCtrl.text;

    return Scaffold(
      bottomNavigationBar: AppKeypad(
        addCharacter: addCharacter,
        removeCharacter: removeCharacter,
        code: code,
        codeLength: codeLength,
        confirmAction: triggerVerifyEmail,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const AppText(
              'Verify it’s you',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            RichText(
              text: TextSpan(
                text: "We send a code to ( ",
                style: const TextStyle(
                    color: AppColors.grey500,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
                children: [
                  TextSpan(
                    text: "*****${email.substring(email.indexOf('@'))}",
                    style: const TextStyle(
                        color: AppColors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  const TextSpan(
                    text: " ). Enter it here to verify your identity",
                    style: TextStyle(
                        color: AppColors.grey500,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(codeLength, (index) {
                return SingleCharaterInput(
                  character: code.text.length <= index ? '' : code.text[index],
                  isActive: code.text.length == index,
                  inValidCode: accountCubit.state.error != null,
                );
              }),
            ),
            const SizedBox(
              height: 30,
            ),
            CountdownTimer(
              seconds: 30,
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
