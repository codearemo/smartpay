import 'package:assesment_test/base_app/config/constant_var.dart';
import 'package:assesment_test/base_app/core/abstractions/injection_module.dart';
import 'package:get_it/get_it.dart';

class AppInjectionComponent {
  static AppInjectionComponent instance = AppInjectionComponent._();
  AppInjectionComponent._();

  Future<GetIt> registerModules({
    required List<InjectionModule> modules,
  }) async {
    for (final mod in modules) {
      await mod.registerDepenencies(
        injector: I,
      );
    }
    return I;
  }
}
