import 'package:assesment_test/base_app/utils/colors.dart';
import 'package:flutter/material.dart';

class OnboardingSlideTwo extends StatefulWidget {
  const OnboardingSlideTwo({super.key});

  @override
  State<OnboardingSlideTwo> createState() => _OnboardingSlideTwoState();
}

class _OnboardingSlideTwoState extends State<OnboardingSlideTwo> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height -
        (MediaQuery.of(context).padding.top +
            MediaQuery.of(context).padding.bottom +
            AppBar().preferredSize.height);

    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            bottom: -height * 0.305,
            child: SizedBox(
              width: width * 0.83,
              child: Image.asset(
                'assets/images/onboarding/slide_two/device.png',
              ),
            ),
          ),
          Positioned(
            bottom: -height * 0.5,
            child: Container(
              height: height * 0.5,
              width: width,
              decoration: const BoxDecoration(
                color: AppColors.white,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.white,
                    blurRadius: 20,
                    spreadRadius: 35,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 15,
            top: height * 0.185,
            width: width * 0.5,
            child: Image.asset(
              'assets/images/onboarding/slide_two/payment.png',
            ),
          ),
          Positioned(
            right: 8,
            top: height * 0.28,
            width: width * 0.5,
            child: Image.asset(
              'assets/images/onboarding/slide_two/contact.png',
            ),
          ),
        ],
      ),
    );
  }
}
