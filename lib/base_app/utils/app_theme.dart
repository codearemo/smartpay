import 'package:assesment_test/base_app/utils/colors.dart';
import 'package:assesment_test/base_app/utils/fonts.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static String cooperStdBlack = "CooperStdBlack";
  static String sailec = "Sailec";

  static ThemeData theme(BuildContext context) => ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          error: AppColors.error,
          background: AppColors.white,
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.white,
          foregroundColor: AppColors.white,
          surfaceTintColor: AppColors.white,
          titleTextStyle: TextStyle(
            color: AppColors.grey900,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            fontFamily: AppFonts.sfProDisplay,
          ),
          iconTheme: IconThemeData(
            color: AppColors.grey500,
          ),
          elevation: 0,
        ),
        fontFamily: AppFonts.sfProDisplay,
        dividerTheme: const DividerThemeData(
            color: AppColors.grey100, thickness: 1, space: 0),
        bottomSheetTheme: BottomSheetThemeData(
            backgroundColor: AppColors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
        dialogTheme: const DialogTheme(
          backgroundColor: AppColors.white,
          surfaceTintColor: AppColors.white,
        ),
        dialogBackgroundColor: AppColors.white,
        splashColor: AppColors.primary.withOpacity(0.5),
        disabledColor: AppColors.grey500,
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
        primaryColor: AppColors.primary,
      );
}
