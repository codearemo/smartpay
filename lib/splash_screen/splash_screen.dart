import 'package:assesment_test/onboarding.dart/onboarding.dart';
import 'package:assesment_test/splash_screen/widgets/typing_brand.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _revealFraction = 0.0;
  final Duration _revealDuration = const Duration(seconds: 1);

  void openOnboardingScreen() {
    Future.delayed(const Duration(
      seconds: 3,
    ), () => Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const OnbaordingScreen(),
      )
    )
    );
  }

  @override
  void initState() {
    super.initState();
    // Start reveal animation
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _revealFraction = 1.0;
      });
    });

    openOnboardingScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRect(
              child: AnimatedOpacity(
                duration: _revealDuration,
                opacity: _revealFraction,
                child: Container(
                  width: 72,
                  height: 72,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/smart_pay_logo.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const TypingText(),
          ],
        ),
      ),
    );
  }
}

