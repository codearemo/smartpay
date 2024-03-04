import 'package:smartpay/base_app/view/onboarding.dart/onboarding.dart';
import 'package:smartpay/base_app/utils/colors.dart';
import 'package:flutter/material.dart';

class OnboardingDots extends StatelessWidget {
  final int currentIndex;
  final List<OnboardingModel> onboardingList;

  const OnboardingDots({
    Key? key,
    required this.currentIndex,
    required this.onboardingList,
  }) : super(key: key);

  Widget buildDot(int index, BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(
        milliseconds: 200,
      ),
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      height: 5,
      width: currentIndex == index ? 30 : 5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.primary,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          onboardingList.length,
          (index) => buildDot(index, context),
        ),
      ),
    );
  }
}
