import 'package:assesment_test/signin/signin_screen.dart';
import 'package:assesment_test/onboarding.dart/widgets/dots.dart';
import 'package:assesment_test/onboarding.dart/widgets/slide_one.dart';
import 'package:assesment_test/onboarding.dart/widgets/slide_two.dart';
import 'package:assesment_test/utils/colors.dart';
import 'package:assesment_test/widgets/app_elevated_button.dart';
import 'package:assesment_test/widgets/app_text.dart';
import 'package:assesment_test/widgets/app_text_button.dart';
import 'package:flutter/material.dart';

class OnboardingModel {
  final Widget widget;
  final String title;
  final String description;

  OnboardingModel({
    required this.widget,
    required this.title,
    required this.description,
  });
}

class OnbaordingScreen extends StatefulWidget {
  const OnbaordingScreen({super.key});

  @override
  State<OnbaordingScreen> createState() => _OnbaordingScreenState();
}

class _OnbaordingScreenState extends State<OnbaordingScreen> {
  int currentIndex = 0;

  List<OnboardingModel> onboardingList = [
    OnboardingModel(
      widget: const OnboardingSlideOne(),
      title: 'Finance app the safest and most trusted',
      description:
          'Your finance work starts here. Our here to help you track and deal with speeding up your transactions.',
    ),
    OnboardingModel(
      widget: const OnboardingSlideTwo(),
      title: 'The fastest transaction process only here',
      description:
          'Get easy to pay all your bills with just a few steps. Paying your bills become fast and efficient.',
    )
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height -
        (MediaQuery.of(context).padding.top +
            MediaQuery.of(context).padding.bottom +
            AppBar().preferredSize.height);

    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        actions: [
          if(currentIndex < onboardingList.length - 1)
          AppTextButton(
            onPressed: () {
              Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SigninScreen(),
                        ),
                      );
            },
            text: 'Skip',
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: height * 0.52,
            child: PageView(
              children: List.generate(
                onboardingList.length,
                (index) {
                  return onboardingList[index].widget;
                },
              ),
              onPageChanged: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
            ),
          ),
          Container(
            height: height * 0.42,
            width: width,
            padding: const EdgeInsets.symmetric(
              vertical: 15,
            ),
            color: AppColors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
              ),
              child: Column(
                children: [
                  AppText(
                    onboardingList[currentIndex].title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AppText(
                    onboardingList[currentIndex].description,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  OnboardingDots(
                    currentIndex: currentIndex,
                    onboardingList: onboardingList,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AppElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SigninScreen(),
                        ),
                      );
                    },
                    child: const Padding(
                      padding:  EdgeInsets.symmetric(
                        vertical: 16,
                      ),
                      child:  Center(
                        child: AppText(
                          'Get Started',
                          style: TextStyle(
                            color: AppColors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
