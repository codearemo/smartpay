import 'dart:convert';

import 'package:assesment_test/base_app/core/app_cubit_state.dart';
import 'package:assesment_test/base_app/core/storage.dart';
import 'package:assesment_test/modules/account/entities/request_verification_entity.dart';
import 'package:assesment_test/modules/account/entities/signin_entity.dart';
import 'package:assesment_test/modules/account/entities/signup_entity.dart';
import 'package:assesment_test/modules/account/entities/verify_email_entity.dart';
import 'package:assesment_test/modules/account/models/signin_model.dart';
import 'package:assesment_test/modules/account/repos/account_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountCubit extends Cubit<AppCubitState> {
  final AccountRepo _repo;

  AccountCubit(this._repo) : super(const AppCubitState());

  SigninModel? loggedInUser;
  List<SigninModel> userList = [];
  String userListKey = 'user_list';

  Future<void> setUserList() async {
    final storage = StorageImpl();

    final List<dynamic> data =
        jsonDecode(await storage.getData(key: userListKey));

    userList = data
        .map((e) => SigninModel.fromJson({
              'data': e,
            }))
        .toList();
  }

  Future<void> saveUserListToStorage(String pin) async {
    final storage = StorageImpl();

    userList.add(SigninModel(
        data: loggedInUser?.data?.copyWith(
            user: loggedInUser?.data?.user?.copyWith(
      pin: pin,
    ))));

    await storage.storeData(
        key: userListKey,
        value: jsonEncode(
          userList
              .map((e) => (e.data?.copyWith(
                      user: e.data?.user?.copyWith(
                    pin: pin,
                  )))?.toJson())
              .toList(),
        ));
  }

  Future<String?> getUserListFromStorage() async {
    final storage = StorageImpl();

    return await storage.getData(key: userListKey);
  }

  Future<void> signout() async {
    emit(state.copyWith(loading: true, error: null));

    final res = await _repo.signout();

    res.fold((l) {
      emit(state.copyWith(loading: false, error: l, data: null));
    }, (r) async {
      loggedInUser = null;
      emit(state.copyWith(loading: false, data: r));
    });
  }

  Future signin(SigninEntity entity) async {
    emit(state.copyWith(loading: true, error: null));

    final res = await _repo.signin(entity);

    res.fold((l) {
      emit(state.copyWith(loading: false, error: l));
    }, (r) async {
      loggedInUser = r;
      emit(state.copyWith(loading: false, data: r));
    });
  }

  Future signup(SignupEntity signupEntity) async {
    emit(state.copyWith(loading: true, error: null));

    final res = await _repo.signup(signupEntity);

    res.fold((l) {
      emit(state.copyWith(loading: false, error: l));
    }, (r) async {
      emit(state.copyWith(loading: false, data: r));
    });
  }

  Future verifyEmail(VerifyEmailEntity entity) async {
    emit(state.copyWith(loading: true, error: null));

    final res = await _repo.verifyEmail(entity);

    res.fold((l) {
      emit(state.copyWith(loading: false, error: l));
    }, (r) async {
      emit(state.copyWith(loading: false, data: r));
    });
  }

  Future requestVerification(RequestVerificationEntity entity) async {
    emit(state.copyWith(loading: true, error: null));

    final res = await _repo.requestVerification(entity);

    res.fold((l) {
      emit(state.copyWith(loading: false, error: l));
    }, (r) async {
      emit(state.copyWith(loading: false, data: r));
    });
  }
}
