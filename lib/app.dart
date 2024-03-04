import 'package:assesment_test/base_app/core/abstractions/build_config.dart';
import 'package:assesment_test/base_app/resolver/ui_cubit.dart';
import 'package:assesment_test/base_app/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class MyApp extends StatelessWidget {
  final BuildConfig buildConfig;
  final GoRouter routes;

  const MyApp({
    super.key,
    required this.buildConfig,
    required this.routes,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: ScreenUtilInit(
        designSize: const Size(414, 896),
        builder: (context, child) => child!,
        minTextAdapt: true,
        splitScreenMode: true,
        child: MultiBlocProvider(
          providers: getCubit(),
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.theme(context),
            routerDelegate: routes.routerDelegate,
            routeInformationParser: routes.routeInformationParser,
            routeInformationProvider: routes.routeInformationProvider,
            title: buildConfig.appName,
          ),
        ),
      ),
    );
  }
}
