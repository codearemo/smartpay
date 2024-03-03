import 'package:assesment_test/signup/signup_congratulations_screen.dart';
import 'package:assesment_test/utils/colors.dart';
import 'package:assesment_test/widgets/app_text.dart';
import 'package:assesment_test/widgets/keypad/number_keypad.dart';
import 'package:assesment_test/widgets/single_character_input.dart';
import 'package:flutter/material.dart';

class SetPin extends StatefulWidget {
  const SetPin({super.key});

  @override
  State<SetPin> createState() => _SetPinState();
}

class _SetPinState extends State<SetPin> {
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
        confirmAction: () {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (context) => const SignupCongratulationsScreen()),
              (route) => false);
        },
        buttonText: 'Create PIN',
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const AppText(
              'Set your PIN code',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const AppText(
                'We use state-of-the-art security measures to protect your information at all times'),
            const SizedBox(
              height: 35,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(codeLength, (index) {
                return SingleCharaterInput(
                  character: code.text.length <= index ? '' : code.text[index],
                  isActive: code.text.length == index,
                  encrypted: true,
                );
              }),
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
