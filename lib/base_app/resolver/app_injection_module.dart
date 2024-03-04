import 'dart:async';

import 'package:assesment_test/base_app/core/api.dart';
import 'package:assesment_test/base_app/core/storage.dart';
import 'package:assesment_test/modules/account/presentation/state/account_cubit.dart';
import 'package:assesment_test/modules/account/repos/account_repo.dart';
import 'package:assesment_test/modules/account/repos/account_repo_impl.dart';
import 'package:assesment_test/modules/account/services/account_service.dart';
import 'package:assesment_test/modules/account/services/account_service_impl.dart';
import 'package:assesment_test/modules/utils/presentation/state/utils_cubit.dart';
import 'package:assesment_test/modules/utils/repos/utils_repo.dart';
import 'package:assesment_test/modules/utils/repos/utils_repo_impl.dart';
import 'package:assesment_test/modules/utils/services/utils_service.dart';
import 'package:assesment_test/modules/utils/services/utils_service_impl.dart';
import 'package:get_it/get_it.dart';

import '../core/abstractions/injection_module.dart';

class BaseAppInjectionModule implements InjectionModule {
  @override
  FutureOr<void> registerDepenencies({
    required GetIt injector,
  }) {
    injector.registerLazySingleton<Storage>(() => StorageImpl());

    injector.registerLazySingleton(() => Api());

    // Utils Module
    injector.registerFactory(() => UtilsCubit(
          injector.get(),
        ));

    injector.registerLazySingleton<UtilsRepo>(() => UtilsRepoImpl(
          injector.get(),
        ));

    injector.registerLazySingleton<UtilsService>(() => UtilsServiceImpl(
          injector.get(),
          injector.get(),
        ));

    // Account Module
    injector.registerFactory(() => AccountCubit(
          injector.get(),
        ));

    injector.registerLazySingleton<AccountRepo>(() => AccountRepoImpl(
          injector.get(),
        ));

    injector.registerLazySingleton<AccountService>(() => AccountServiceImpl(
          injector.get(),
          injector.get(),
        ));
  }
}
