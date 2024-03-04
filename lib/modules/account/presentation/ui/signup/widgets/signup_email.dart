import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:assesment_test/base_app/utils/colors.dart';
import 'package:assesment_test/base_app/utils/constants.dart';
import 'package:assesment_test/base_app/utils/form_validators.dart';
import 'package:assesment_test/base_app/view/widgets/alternative_auth.dart';
import 'package:assesment_test/base_app/view/widgets/app_alert.dart';
import 'package:assesment_test/base_app/view/widgets/app_elevated_button.dart';
import 'package:assesment_test/base_app/view/widgets/app_input_field.dart';
import 'package:assesment_test/base_app/view/widgets/app_text.dart';
import 'package:assesment_test/modules/account/entities/request_verification_entity.dart';
import 'package:assesment_test/modules/account/presentation/state/account_cubit.dart';
import 'package:assesment_test/modules/account/presentation/ui/signup/widgets/signin_link.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupEmail extends StatefulWidget {
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
  State<SignupEmail> createState() => _SignupEmailState();
}

class _SignupEmailState extends State<SignupEmail> {

  void triggerRequestVerification() async {
    final AccountCubit accountCubit = context.read<AccountCubit>();

    if (widget.formKey.currentState!.validate()) {
      widget.formKey.currentState!.save();
      final RequestVerificationEntity verificationEntity =
          RequestVerificationEntity(
        email: widget.emailTextCtrl.text.trim(),
      );

      await accountCubit.requestVerification(
        verificationEntity,
      );

      if (mounted) {
        if (accountCubit.state.error == null) {
          widget.gotoNextPage();
        } else {
          AppAlerts.showAlert(accountCubit.state.error.toString(), context,
              type: AnimatedSnackBarType.error);
        }
      }
    }
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
                text: "Create a ",
                style: TextStyle(
                    color: AppColors.grey900,
                    fontSize: 24,
                    fontWeight: FontWeight.w600),
                children: [
                  TextSpan(
                    text: "Smartpay",
                    style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 24,
                        fontWeight: FontWeight.w600),
                  ),
                  TextSpan(
                    text: "\naccount",
                    style: TextStyle(
                        color: AppColors.grey900,
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
              hintText: 'Email',
              keyboardType: TextInputType.emailAddress,
              validator: AppFormValidator.validateEmail,
              controller: widget.emailTextCtrl,
            ),
            const SizedBox(
              height: 35,
            ),
            AppElevatedButton(
              onPressed: triggerRequestVerification,
              loading: accountCubit.state.loading,
              disabled: accountCubit.state.loading,
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
