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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: AppBackButton(
          onTap: gotoPreviousPage,
        ),
      ),
      body: SafeArea(
        child: PageView(
          controller: pageController,
          onPageChanged: (value) {
            curentPageIndex = value;
          },
          children: const [
            SignupEmail(),
            VerifyEmail(),
            PersonalInfoScreen(),
            SetPin(),
          ],
        ),
      ),
    );
  }
}
