import 'package:assesment_test/utils/colors.dart';
import 'package:flutter/material.dart';

class OnboardingSlideOne extends StatefulWidget {
  const OnboardingSlideOne({super.key});

  @override
  State<OnboardingSlideOne> createState() => _OnboardingSlideOneState();
}

class _OnboardingSlideOneState extends State<OnboardingSlideOne> {
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
                'assets/images/onboarding/slide_one/device.png',
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
            left: width * 0.11,
            top: height * 0.085,
            child: SizedBox(
              width: width * 0.23,
              height: width * 0.23,
              child: Transform.rotate(
                angle: -0.3,
                child: Image.asset(
                  'assets/images/onboarding/slide_one/lock_badge.png',
                ),
              ),
            ),
          ),
          Positioned(
            left: 15,
            top: height * 0.38,
            width: width * 0.5,
            child: Image.asset(
              'assets/images/onboarding/slide_one/notification.png',
            ),
          ),
          Positioned(
            right: 10,
            top: height * 0.27,
            width: width * 0.6,
            child: Image.asset(
              'assets/images/onboarding/slide_one/stats.png',
            ),
          ),
        ],
      ),
    );
  }
}
