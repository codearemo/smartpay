import 'package:assesment_test/splash_screen/splash_screen.dart';
import 'package:assesment_test/utils/colors.dart';
import 'package:assesment_test/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: MaterialApp(
        title: 'Smartpay',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: AppColors.primary,
          ),
          useMaterial3: true,
          scaffoldBackgroundColor: AppColors.white,
          appBarTheme: const AppBarTheme(
            backgroundColor: AppColors.white,
            foregroundColor: AppColors.white,
            surfaceTintColor: AppColors.white,
            titleTextStyle:  TextStyle(
              color: AppColors.grey900,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              fontFamily: AppFonts.sfProDisplay,
            ),
            iconTheme:  IconThemeData(
              color: AppColors.grey900,
            ),
            elevation: 0,
          ),
          fontFamily: AppFonts.sfProDisplay,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const SplashScreen();
  }
}
