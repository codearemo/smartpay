import 'package:assesment_test/signup/widgets/personal_info.dart';
import 'package:assesment_test/signup/widgets/set_pin.dart';
import 'package:assesment_test/signup/widgets/signup_email.dart';
import 'package:assesment_test/signup/widgets/verify_email.dart';
import 'package:assesment_test/widgets/back_button.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
    final _formKey = GlobalKey<FormState>();

  final emailTextCtrl = TextEditingController();
  final codeTextCtrl = TextEditingController();

  final fullNameTextCtrl = TextEditingController();
  final usernameTextCtrl = TextEditingController();
  final countryTextCtrl = TextEditingController();
  final passwordTextCtrl = TextEditingController();

  final pinTextCtrl = TextEditingController();


  final pageController = PageController();
  int curentPageIndex = 0;

  void gotoNextPage() {
    pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOutCubic,
    );
  }

  void gotoPreviousPage() {
    if (curentPageIndex > 0) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOutCubic,
      );
    } else {
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    pageController.dispose();
    emailTextCtrl.dispose();
    codeTextCtrl.dispose();
    fullNameTextCtrl.dispose();
    usernameTextCtrl.dispose();
    countryTextCtrl.dispose();
    passwordTextCtrl.dispose();
    pinTextCtrl.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: AppBackButton(
          onTap: gotoPreviousPage,
        ),
      ),
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: PageView(
            controller: pageController,
            physics: const NeverScrollableScrollPhysics(),
            onPageChanged: (value) {
              curentPageIndex = value;
            },
            children: [
              SignupEmail(
                emailTextCtrl: emailTextCtrl,
                formKey: _formKey,
                gotoNextPage: gotoNextPage,
              ),
              VerifyEmail(
                gotoNextPage: gotoNextPage,
                codeTextCtrl: codeTextCtrl,
              ),
              PersonalInfoScreen(
                gotoNextPage: gotoNextPage,
                formKey: _formKey,
                fullNameTextCtrl: fullNameTextCtrl,
                usernameTextCtrl: usernameTextCtrl,
                countryTextCtrl: countryTextCtrl,
                passwordTextCtrl: passwordTextCtrl,
              ),
              const SetPin(),
            ],
          ),
        ),
      ),
    );
  }
}
