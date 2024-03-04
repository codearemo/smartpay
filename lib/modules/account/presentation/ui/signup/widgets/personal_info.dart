import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:assesment_test/base_app/utils/colors.dart';
import 'package:assesment_test/base_app/utils/constants.dart';
import 'package:assesment_test/base_app/utils/form_validators.dart';
import 'package:assesment_test/base_app/view/widgets/app_alert.dart';
import 'package:assesment_test/base_app/view/widgets/app_dropdown_buttom_sheet.dart';
import 'package:assesment_test/base_app/view/widgets/app_elevated_button.dart';
import 'package:assesment_test/base_app/view/widgets/app_input_field.dart';
import 'package:assesment_test/base_app/view/widgets/app_text.dart';
import 'package:assesment_test/modules/account/entities/signin_entity.dart';
import 'package:assesment_test/modules/account/entities/signup_entity.dart';
import 'package:assesment_test/modules/account/presentation/state/account_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PersonalInfoScreen extends StatefulWidget {
  const PersonalInfoScreen({
    super.key,
    required this.formKey,
    required this.gotoNextPage,
    required this.fullNameTextCtrl,
    required this.usernameTextCtrl,
    required this.countryTextCtrl,
    required this.passwordTextCtrl,
    required this.emailTextCtrl,
  });

  final GlobalKey<FormState> formKey;
  final VoidCallback gotoNextPage;
  final TextEditingController fullNameTextCtrl;
  final TextEditingController usernameTextCtrl;
  final TextEditingController countryTextCtrl;
  final TextEditingController passwordTextCtrl;
  final TextEditingController emailTextCtrl;

  @override
  State<PersonalInfoScreen> createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  void triggerSignup() async {
    final AccountCubit accountCubit = context.read<AccountCubit>();

    if (widget.formKey.currentState!.validate()) {
      widget.formKey.currentState!.save();
      final SignupEntity signupEntity = SignupEntity(
        fullName: widget.fullNameTextCtrl.text.trim(),
        username: widget.usernameTextCtrl.text.trim(),
        country: widget.countryTextCtrl.text.trim(),
        password: widget.passwordTextCtrl.text.trim(),
        email: widget.emailTextCtrl.text.trim(),
        deviceName: 'web',
      );

      final SigninEntity signinEntity = SigninEntity(
        email: widget.emailTextCtrl.text.trim(),
        password: widget.passwordTextCtrl.text.trim(),
        deviceName: 'web',
      );

      await accountCubit.signup(
        signupEntity,
      );

      if (accountCubit.state.error == null) {
        await accountCubit.signin(signinEntity);
        if (mounted) {
          if (accountCubit.state.error == null) {
            widget.gotoNextPage();
          } else {
            AppAlerts.showAlert(accountCubit.state.error.toString(), context,
                type: AnimatedSnackBarType.error);
          }
        }
      } else {
        if (mounted) {
          AppAlerts.showAlert(accountCubit.state.error.toString(), context,
              type: AnimatedSnackBarType.error);
        }
      }
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final AccountCubit accountCubit = context.watch<AccountCubit>();

    return Padding(
      padding: const EdgeInsets.all(AppConstants.generalPadding),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            RichText(
              text: const TextSpan(
                text: "Hey there! tell us a bit \nabout ",
                style: TextStyle(
                    color: AppColors.grey900,
                    fontSize: 24,
                    fontWeight: FontWeight.w600),
                children: [
                  TextSpan(
                    text: "yourself",
                    style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 24,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            AppInputField(
              hintText: 'Full name',
              textCapitalization: TextCapitalization.words,
              controller: widget.fullNameTextCtrl,
              validator: (value) {
                return AppFormValidator.validateField(value, 'Full name');
              },
            ),
            const SizedBox(
              height: 15,
            ),
            AppInputField(
              hintText: 'Username',
              controller: widget.usernameTextCtrl,
              validator: (value) {
                return AppFormValidator.validateField(value, 'Username');
              },
            ),
            const SizedBox(
              height: 15,
            ),
            AppDropdownBottomSheet(
              countryNameTextCtrl: widget.countryTextCtrl,
              validator: (value) {
                return AppFormValidator.validateField(value, 'Country');
              },
            ),
            const SizedBox(
              height: 15,
            ),
            AppInputField(
              hintText: 'Password',
              obscureText: true,
              controller: widget.passwordTextCtrl,
              validator: AppFormValidator.validatePassword,
            ),
            const SizedBox(
              height: 35,
            ),
            AppElevatedButton(
              loading: accountCubit.state.loading,
              disabled: accountCubit.state.loading,
              onPressed: triggerSignup,
              child: const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 16,
                ),
                child: Center(
                  child: AppText(
                    'Continue',
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
            )
          ],
        ),
      ),
    );
  }
}
