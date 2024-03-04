import 'package:smartpay/modules/account/presentation/state/account_cubit.dart';
import 'package:smartpay/modules/utils/presentation/state/utils_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

getCubit() {
  return [
    BlocProvider<AccountCubit>(create: (_) => GetIt.I<AccountCubit>()),
    BlocProvider<UtilsCubit>(create: (_) => GetIt.I<UtilsCubit>()),
  ];
}
