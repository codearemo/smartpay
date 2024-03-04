import 'package:assesment_test/base_app/router/route_name.dart';
import 'package:assesment_test/base_app/utils/utils.dart';
import 'package:assesment_test/base_app/view/widgets/app_text.dart';
import 'package:assesment_test/base_app/view/widgets/keypad/number_keypad.dart';
import 'package:assesment_test/base_app/view/widgets/single_character_input.dart';
import 'package:assesment_test/modules/account/presentation/state/account_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    final AccountCubit accountCubit = context.watch<AccountCubit>();
    
    return Scaffold(
      bottomNavigationBar: AppKeypad(
        addCharacter: addCharacter,
        removeCharacter: removeCharacter,
        code: code,
        codeLength: codeLength,
        confirmAction: () {
          accountCubit.saveUserListToStorage(code.text.trim());

          AppUtils.pushAndRemoveUntil(
              context, AppRoutes.signupConfirmationRoute);
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
