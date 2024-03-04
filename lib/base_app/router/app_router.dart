import 'package:assesment_test/base_app/core/abstractions/router_module.dart';
import 'package:assesment_test/base_app/router/route_name.dart';
import 'package:assesment_test/base_app/view/dashbaord/dashboard_screen.dart';
import 'package:assesment_test/modules/account/presentation/ui/forgot_password/create_new_password_screen.dart';
import 'package:assesment_test/modules/account/presentation/ui/forgot_password/forgot_password.dart';
import 'package:assesment_test/base_app/view/onboarding.dart/onboarding.dart';
import 'package:assesment_test/base_app/view/splash_screen/splash_screen.dart';
import 'package:assesment_test/modules/account/presentation/ui/enter_pin/enter_pin_screen.dart';
import 'package:assesment_test/modules/account/presentation/ui/signin/signin_screen.dart';
import 'package:assesment_test/modules/account/presentation/ui/signup/signup_congratulations_screen.dart';
import 'package:assesment_test/modules/account/presentation/ui/signup/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BaseAppRouteModule implements RouterModule {
  @override
  List<RouteBase> getRoutes() {
    return [
      GoRoute(
        path: AppRoutes.splashRoute,
        name: AppRoutes.splashRoute,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: AppRoutes.onboardingRoute,
        name: AppRoutes.onboardingRoute,
        pageBuilder: (context, state) {
          return MaterialPage(
            child: OnboardingScreen(
              key: state.pageKey,
            ),
          );
        },
      ),
      GoRoute(
        path: AppRoutes.signinRoute,
        name: AppRoutes.signinRoute,
        pageBuilder: (context, state) {
          return MaterialPage(
            child: SigninScreen(
              key: state.pageKey,
            ),
          );
        },
      ),
      GoRoute(
        path: AppRoutes.signupRoute,
        name: AppRoutes.signupRoute,
        pageBuilder: (context, state) {
          return MaterialPage(
            child: SignupScreen(
              key: state.pageKey,
            ),
          );
        },
      ),
      GoRoute(
        path: AppRoutes.signupConfirmationRoute,
        name: AppRoutes.signupConfirmationRoute,
        pageBuilder: (context, state) {
          return MaterialPage(
            child: SignupCongratulationsScreen(
              key: state.pageKey,
            ),
          );
        },
      ),
      GoRoute(
        path: AppRoutes.recoverPasswordRoute,
        name: AppRoutes.recoverPasswordRoute,
        pageBuilder: (context, state) {
          return NoTransitionPage(
            child: ForgotPasswordScreen(
              key: state.pageKey,
            ),
          );
        },
      ),
      GoRoute(
        path: AppRoutes.enterNewPasswordRoute,
        pageBuilder: (context, state) {
          return NoTransitionPage(
            child: NewPasswordScreen(
              key: state.pageKey,
            ),
          );
        },
      ),
      GoRoute(
        path: AppRoutes.signinWithPinRoute,
        pageBuilder: (context, state) {
          return NoTransitionPage(
            child: SigninWithPinScreen(
              key: state.pageKey,
            ),
          );
        },
      ),
      GoRoute(
        path: AppRoutes.dashboardRoute,
        pageBuilder: (context, state) {
          return NoTransitionPage(
            child: DashboardScreen(
              key: state.pageKey,
            ),
          );
        },
      ),
    ];
  }
}
