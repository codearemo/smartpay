import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:smartpay/base_app/router/route_name.dart';
import 'package:smartpay/base_app/utils/constants.dart';
import 'package:smartpay/base_app/utils/size.dart';
import 'package:smartpay/base_app/utils/utils.dart';
import 'package:smartpay/base_app/view/widgets/app_alert.dart';
import 'package:smartpay/base_app/view/widgets/app_elevated_button.dart';
import 'package:smartpay/base_app/view/widgets/app_text.dart';
import 'package:smartpay/base_app/view/widgets/app_text_button.dart';
import 'package:smartpay/modules/account/presentation/state/account_cubit.dart';
import 'package:smartpay/modules/utils/presentation/state/utils_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  triggerFetchDashbaordInfo() {
    final UtilsCubit utilsCubit = context.read<UtilsCubit>();
    utilsCubit.fetchDashbaordInfo();

    if (mounted) {
      if (utilsCubit.state.error == null) {
      } else {
        AppAlerts.showAlert(
          utilsCubit.state.error.toString(),
          context,
          type: AnimatedSnackBarType.error,
        );
      }
    }
  }

  @override
  void initState() {
    super.initState();

    triggerFetchDashbaordInfo();
  }

  @override
  Widget build(BuildContext context) {
    final UtilsCubit utilsCubit = context.watch<UtilsCubit>();
    final AccountCubit accountCubit = context.watch<AccountCubit>();

    return Scaffold(
        appBar: AppBar(
          title: const Text('Dashboard'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(AppConstants.generalPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppText(
                'Hello, ${accountCubit.loggedInUser?.data?.user?.fullName}',
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              S.h(50),
              AppText(
                utilsCubit.dashbaordInfo?.data?.secret ?? 'Fetching quote...',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                )
              ),
              S.h(60),
              AppElevatedButton(
                loading: utilsCubit.state.loading,
                disabled: utilsCubit.state.loading,
                onPressed: triggerFetchDashbaordInfo,
                child: const AppText(
                  'Another Quote',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const Spacer(),
              AppTextButton(
                text: 'Sign out',
                onPressed: () async {
                  await accountCubit.signout();

                  if (mounted) {
                    if (accountCubit.state.error == null) {
                      AppUtils.pushAndRemoveUntil(
                          context, AppRoutes.signinRoute);
                    } else {
                      AppAlerts.showAlert(
                          accountCubit.state.error.toString(), context,
                          type: AnimatedSnackBarType.error);
                    }
                  }
                },
              ),
            ],
          ),
        ));
  }
}
