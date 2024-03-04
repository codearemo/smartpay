import 'package:smartpay/base_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AppLoaders {
  static Widget circularProgress = const Center(
    child: CircularProgressIndicator(
      strokeWidth: 2,
      color: AppColors.white,
    ),
  );
 
  static Widget invertedCircularProgress = const Center(
    child: CircularProgressIndicator(
      strokeWidth: 2,
      color: AppColors.grey900,
    ),
  );

  static Widget shimmerLoader = Shimmer(
    gradient: const LinearGradient(colors: [AppColors.grey300, Colors.white]),
    child: Container(
      color: AppColors.grey300,
    ),
  );

  static String textLoader = 'Please wait...';
}
