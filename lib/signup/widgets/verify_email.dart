import 'package:assesment_test/utils/colors.dart';
import 'package:assesment_test/widgets/app_text.dart';
import 'package:assesment_test/widgets/keypad/number_keypad.dart';
import 'package:assesment_test/widgets/single_character_input.dart';
import 'package:flutter/material.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({super.key});

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

  @override
  void dispose() {
    code.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AppKeypad(
        addCharacter: addCharacter,
        removeCharacter: removeCharacter,
        code: code,
        codeLength: codeLength,
        confirmAction: () {},
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
              text: const TextSpan(
                text: "We send a code to ( ",
                style: TextStyle(
                    color: AppColors.grey500,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
                children: [
                  TextSpan(
                    text: "*****@mail.com",
                    style: TextStyle(
                        color: AppColors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  TextSpan(
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
                );
              }),
            ),
            const SizedBox(
              height: 30,
            ),
            const AppText(
              'Resend Code 30 secs',
              style: TextStyle(
                color: AppColors.lightGrey,
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
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
