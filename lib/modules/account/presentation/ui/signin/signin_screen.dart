import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:assesment_test/base_app/router/route_name.dart';
import 'package:assesment_test/base_app/utils/form_validators.dart';
import 'package:assesment_test/base_app/utils/utils.dart';
import 'package:assesment_test/base_app/view/widgets/alternative_auth.dart';
import 'package:assesment_test/base_app/utils/colors.dart';
import 'package:assesment_test/base_app/utils/constants.dart';
import 'package:assesment_test/base_app/view/widgets/app_alert.dart';
import 'package:assesment_test/base_app/view/widgets/app_elevated_button.dart';
import 'package:assesment_test/base_app/view/widgets/app_input_field.dart';
import 'package:assesment_test/base_app/view/widgets/app_text.dart';
import 'package:assesment_test/base_app/view/widgets/app_text_button.dart';
import 'package:assesment_test/base_app/view/widgets/back_button.dart';
import 'package:assesment_test/modules/account/entities/signin_entity.dart';
import 'package:assesment_test/modules/account/presentation/state/account_cubit.dart';
import 'package:assesment_test/modules/account/presentation/ui/signin/widgets/signup_link.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final _formKey = GlobalKey<FormState>();

  final emailTextCtrl = TextEditingController();
  final passwordTextCtrl = TextEditingController();

  void signUserIn() async {
    final AccountCubit accountCubit = context.read<AccountCubit>();
      if (_formKey.currentState!.validate()) {
        _formKey.currentState?.save();

        final SigninEntity signinEntity = SigninEntity(
          email: emailTextCtrl.text.trim(),
          password: passwordTextCtrl.text.trim(),
          deviceName: 'web',
        );

        await accountCubit.signin(
          signinEntity,
        );

        if (mounted) {
          if (accountCubit.state.error == null) {
            AppUtils.pushAndRemoveUntil(context, AppRoutes.dashboardRoute);
          } else {
            AppAlerts.showAlert(accountCubit.state.error.toString(), context,
                type: AnimatedSnackBarType.error);
          }
        }
      }
  }

  @override
  void dispose() {
    emailTextCtrl.dispose();
    passwordTextCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AccountCubit accountCubit = context.watch<AccountCubit>();

    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButton(),
      ),
      bottomNavigationBar: const Padding(
        padding: EdgeInsets.only(
          bottom: 30,
        ),
        child: SignupLink(),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(AppConstants.generalPadding),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const AppText(
                    'Hi There! 👋',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const AppText(
                    'Welcome back, Sign in to your account',
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  AppInputField(
                    hintText: 'Email',
                    keyboardType: TextInputType.emailAddress,
                    validator: AppFormValidator.validateEmail,
                    controller: emailTextCtrl,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  AppInputField(
                    validator: AppFormValidator.validatePassword,
                    hintText: 'Password',
                    obscureText: true,
                    controller: passwordTextCtrl,
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  Row(
                    children: [
                      AppTextButton(
                        onPressed: () {
                          context.push(AppRoutes.recoverPasswordRoute);
                        },
                        text: 'Forgot Password?',
                        padding: const EdgeInsets.all(0),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  AppElevatedButton(
                    disabled: accountCubit.state.loading,
                    loading: accountCubit.state.loading,
                    onPressed: () {
                      signUserIn();
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 16,
                      ),
                      child: Center(
                        child: AppText(
                          'Sign In',
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
