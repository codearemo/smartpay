import 'package:assesment_test/base_app/router/route_name.dart';
import 'package:assesment_test/base_app/view/onboarding.dart/widgets/dots.dart';
import 'package:assesment_test/base_app/view/onboarding.dart/widgets/slide_one.dart';
import 'package:assesment_test/base_app/view/onboarding.dart/widgets/slide_two.dart';
import 'package:assesment_test/base_app/utils/colors.dart';
import 'package:assesment_test/base_app/view/widgets/app_elevated_button.dart';
import 'package:assesment_test/base_app/view/widgets/app_text.dart';
import 'package:assesment_test/base_app/view/widgets/app_text_button.dart';
import 'package:assesment_test/modules/account/presentation/ui/signin/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
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
              context.push(AppRoutes.signinRoute);
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
                      context.push(AppRoutes.signinRoute);
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
