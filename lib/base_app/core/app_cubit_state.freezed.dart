// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_cubit_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppCubitState {
  bool get loading => throw _privateConstructorUsedError;
  Failure? get error => throw _privateConstructorUsedError;
  dynamic get data => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppCubitStateCopyWith<AppCubitState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppCubitStateCopyWith<$Res> {
  factory $AppCubitStateCopyWith(
          AppCubitState value, $Res Function(AppCubitState) then) =
      _$AppCubitStateCopyWithImpl<$Res, AppCubitState>;
  @useResult
  $Res call({bool loading, Failure? error, dynamic data});
}

/// @nodoc
class _$AppCubitStateCopyWithImpl<$Res, $Val extends AppCubitState>
    implements $AppCubitStateCopyWith<$Res> {
  _$AppCubitStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? error = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Failure?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AccountgCubitStateCopyWith<$Res>
    implements $AppCubitStateCopyWith<$Res> {
  factory _$$AccountgCubitStateCopyWith(_$AccountgCubitState value,
          $Res Function(_$AccountgCubitState) then) =
      __$$AccountgCubitStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool loading, Failure? error, dynamic data});
}

/// @nodoc
class __$$AccountgCubitStateCopyWithImpl<$Res>
    extends _$AppCubitStateCopyWithImpl<$Res, _$AccountgCubitState>
    implements _$$AccountgCubitStateCopyWith<$Res> {
  __$$AccountgCubitStateCopyWithImpl(
      _$AccountgCubitState _value, $Res Function(_$AccountgCubitState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? error = freezed,
    Object? data = freezed,
  }) {
    return _then(_$AccountgCubitState(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Failure?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$AccountgCubitState implements AccountgCubitState {
  const _$AccountgCubitState({this.loading = false, this.error, this.data});

  @override
  @JsonKey()
  final bool loading;
  @override
  final Failure? error;
  @override
  final dynamic data;

  @override
  String toString() {
    return 'AppCubitState(loading: $loading, error: $error, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountgCubitState &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.error, error) || other.error == error) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, loading, error, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountgCubitStateCopyWith<_$AccountgCubitState> get copyWith =>
      __$$AccountgCubitStateCopyWithImpl<_$AccountgCubitState>(
          this, _$identity);
}

abstract class AccountgCubitState implements AppCubitState {
  const factory AccountgCubitState(
      {final bool loading,
      final Failure? error,
      final dynamic data}) = _$AccountgCubitState;

  @override
  bool get loading;
  @override
  Failure? get error;
  @override
  dynamic get data;
  @override
  @JsonKey(ignore: true)
  _$$AccountgCubitStateCopyWith<_$AccountgCubitState> get copyWith =>
      throw _privateConstructorUsedError;
}
