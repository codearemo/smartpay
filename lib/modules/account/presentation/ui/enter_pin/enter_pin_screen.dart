import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:smartpay/base_app/utils/colors.dart';
import 'package:smartpay/base_app/utils/constants.dart';
import 'package:smartpay/base_app/utils/size.dart';
import 'package:smartpay/base_app/view/widgets/app_alert.dart';
import 'package:smartpay/modules/account/models/signin_model.dart';
import 'package:smartpay/modules/account/presentation/state/account_cubit.dart';
import 'package:smartpay/modules/account/presentation/ui/enter_pin/widget/users_dropdown.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:smartpay/base_app/view/widgets/app_text.dart';
import 'package:smartpay/base_app/view/widgets/keypad/number_keypad.dart';
import 'package:smartpay/base_app/router/route_name.dart';
import 'package:smartpay/base_app/view/widgets/single_character_input.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SigninWithPinScreen extends StatefulWidget {
  const SigninWithPinScreen({super.key});

  @override
  State<SigninWithPinScreen> createState() => _SigninWithPinScreenState();
}

class _SigninWithPinScreenState extends State<SigninWithPinScreen> {
  final code = TextEditingController();
  final int codeLength = 5;
  late SigninModel? selectedUser;
  bool invalidCode = false;

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

  void confirmSigninWithPin() async {
    final AccountCubit accountCubit = context.read<AccountCubit>();

    if (mounted) {
      if (selectedUser?.data?.user?.pin == code.text) {
        accountCubit.loggedInUser = selectedUser;

        context.pushReplacement(AppRoutes.dashboardRoute);
      } else {
        setState(() {
          invalidCode = true;
        });
        AppAlerts.showAlert('Wrong PIN', context,
            type: AnimatedSnackBarType.error);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    final AccountCubit accountCubit = context.read<AccountCubit>();

    selectedUser = accountCubit.userList.first;
  }

  @override
  Widget build(BuildContext context) {
    final AccountCubit accountCubit = context.watch<AccountCubit>();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppConstants.generalPadding),
          child: AppKeypad(
            addCharacter: addCharacter,
            removeCharacter: removeCharacter,
            code: code,
            codeLength: codeLength,
            confirmAction: confirmSigninWithPin,
            buttonText: 'Enter PIN',
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                      'Hello ${selectedUser?.data?.user?.username}',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    UserDropDown(
                      items: accountCubit.userList,
                      onChanged: (p0) {
                        setState(() {
                          selectedUser = p0;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const AppText('Please enter your PIN code to continue.'),
                const SizedBox(
                  height: 35,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(codeLength, (index) {
                    return SingleCharaterInput(
                      character:
                          code.text.length <= index ? '' : code.text[index],
                      isActive: code.text.length == index,
                      encrypted: true,
                      inValidCode: invalidCode,
                    );
                  }),
                ),
                S.h(70),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: "",
                    style: const TextStyle(
                      color: AppColors.grey500,
                      fontSize: 16,
                    ),
                    children: [
                      TextSpan(
                        text: "Sign in",
                        style: const TextStyle(
                          color: AppColors.primary,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            context.pushReplacement(AppRoutes.signinRoute);
                          },
                      ),
                      const TextSpan(
                        text: " as a different user.",
                        style: TextStyle(
                          color: AppColors.grey500,
                          fontSize: 16,
                        ),
                      ),
                    ],
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
