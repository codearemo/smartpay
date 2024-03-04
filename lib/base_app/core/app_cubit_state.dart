import 'package:assesment_test/base_app/core/error/failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_cubit_state.freezed.dart';

@freezed
class AppCubitState with _$AppCubitState {
  const factory AppCubitState({
    @Default(false) bool loading,
    Failure? error,
    dynamic data,
  }) = AccountgCubitState;
}
