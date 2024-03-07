import 'package:smartpay/modules/utils/models/country_model.dart';
import 'package:smartpay/modules/utils/models/random_message_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartpay/base_app/core/app_cubit_state.dart';
import 'package:smartpay/modules/utils/repos/utils_repo.dart';

class UtilsCubit extends Cubit<AppCubitState> {
  final UtilsRepo _repo;

  UtilsCubit(this._repo) : super(const AppCubitState());

  RandomMessageModel? dashbaordInfo;
  List<CountryModel>? countries;

  Future<void> fetchDashbaordInfo() async {
    emit(state.copyWith(loading: true, error: null));
    final res = await _repo.fetchDashbaordInfo();

    res.fold((l) {
      emit(state.copyWith(loading: false, error: l));
    }, (r) {
      dashbaordInfo = r;
      emit(state.copyWith(loading: false, data: r));
    });
  }

  Future<void> fetchCountries() async {
    emit(state.copyWith(loading: true, error: null));
    final res = await _repo.fetchCountries();

    res.fold((l) {
      emit(state.copyWith(loading: false, error: l));
    }, (r) {
      countries = r;
      (countries)?.sort((a, b) => '${a.name?.common}'.compareTo('${b.name?.common}'));
      emit(state.copyWith(loading: false, data: r));
    });
  }
}
