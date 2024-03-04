import 'package:smartpay/base_app/core/storage.dart';
import 'package:smartpay/base_app/router/route_name.dart';
import 'package:smartpay/base_app/view/splash_screen/widgets/typing_brand.dart';
import 'package:smartpay/modules/account/presentation/state/account_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _revealFraction = 0.0;
  final Duration _revealDuration = const Duration(seconds: 1);

  void runningApp() {
    Future.delayed(
      const Duration(
        seconds: 3,
      ),
      () => checkForToken(),
    );
  }

  void checkForToken() async {
    final AccountCubit accountCubit = context.read<AccountCubit>();

    final storage = StorageImpl();
    final userList = await storage.getData(key: accountCubit.userListKey);

    if (mounted) {
      if (userList != null) {
        await accountCubit.setUserList();
        if (mounted) {
        context.pushReplacement(AppRoutes.signinWithPinRoute);
        }
      } else {
        context.pushReplacement(AppRoutes.onboardingRoute);
      }
    }
  }

  @override
  void initState() {
    super.initState();

    runningApp();

    // Reveal Splash animation
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _revealFraction = 1.0;
      });
    });

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
