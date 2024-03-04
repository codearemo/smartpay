import 'package:assesment_test/base_app/utils/colors.dart';
import 'package:assesment_test/base_app/utils/constants.dart';
import 'package:assesment_test/base_app/view/widgets/app_elevated_button.dart';
import 'package:assesment_test/base_app/view/widgets/app_text.dart';
import 'package:assesment_test/base_app/view/widgets/keypad/app_key.dart';
import 'package:assesment_test/modules/account/presentation/state/account_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppInputKey {
  final Widget child;
  final VoidCallback onPressed;

  const AppInputKey({
    required this.child,
    required this.onPressed,
  });
}

class AppKeypad extends StatefulWidget {
  const AppKeypad({
    super.key,
    required this.child,
    required this.addCharacter,
    required this.removeCharacter,
    required this.code,
    required this.codeLength,
    required this.confirmAction,
    this.buttonText = 'Confirm',
  });

  final Widget child;
  final TextEditingController code;
  final int codeLength;
  final Function addCharacter;
  final Function removeCharacter;
  final VoidCallback confirmAction;
  final String buttonText;

  @override
  State<AppKeypad> createState() => _AppKeypadState();
}

class _AppKeypadState extends State<AppKeypad> {
  late List<AppInputKey> appInputKeys;

  setupKeypad() {
    appInputKeys = [
      ...List.generate(
        9,
        (index) => AppInputKey(
          child: AppText(
            '${index + 1}',
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 24,
            ),
          ),
          onPressed: () {
            widget.addCharacter('${index + 1}');
          },
        ),
      ),
      AppInputKey(
        child: const AppText(
          '*',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 24,
          ),
        ),
        onPressed: () {
          widget.addCharacter('*');
        },
      ),
      AppInputKey(
        child: const AppText(
          '0',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 24,
          ),
        ),
        onPressed: () {
          widget.addCharacter('0');
        },
      ),
      AppInputKey(
        child: Image.asset(
          'assets/icons/back_space.png',
          width: 25,
        ),
        onPressed: () {
          widget.removeCharacter();
        },
      ),
    ];
  }

  @override
  void initState() {
    super.initState();

    setupKeypad();
  }

  @override
  Widget build(BuildContext context) {
    final AccountCubit accountCubit = context.watch<AccountCubit>();

    return Padding(
      padding: const EdgeInsets.all(AppConstants.generalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          widget.child,
          const Spacer(),
          AppElevatedButton(
            loading: accountCubit.state.loading,
            disabled: accountCubit.state.loading,
            onPressed: widget.code.text.length == widget.codeLength ? widget.confirmAction : null,
            child:  Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 16,
              ),
              child: AppText(
                widget.buttonText,
                style: const TextStyle(
                  color: AppColors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            childAspectRatio: 5 / 3,
            children: List.generate(
              appInputKeys.length,
              (index) {
                return AppKey(
                  onPressed: appInputKeys[index].onPressed,
                  child: appInputKeys[index].child,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

