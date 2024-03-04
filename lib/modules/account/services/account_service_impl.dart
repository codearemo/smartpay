import 'package:assesment_test/base_app/core/api.dart';
import 'package:assesment_test/base_app/core/app_endpoints.dart';
import 'package:assesment_test/base_app/core/storage.dart';
import 'package:assesment_test/modules/account/entities/request_verification_entity.dart';
import 'package:assesment_test/modules/account/entities/signin_entity.dart';
import 'package:assesment_test/modules/account/entities/signup_entity.dart';
import 'package:assesment_test/modules/account/entities/verify_email_entity.dart';
import 'package:assesment_test/modules/account/models/signin_model.dart';
import 'package:assesment_test/modules/account/models/signout_model.dart';
import 'package:assesment_test/modules/account/models/signup_model.dart';
import 'package:assesment_test/modules/account/models/verification_request_model.dart';
import 'package:assesment_test/modules/account/models/verify_email_model.dart';
import 'package:assesment_test/modules/account/services/account_service.dart';
import 'package:dio/dio.dart';

class AccountServiceImpl implements AccountService {
  final Api api;
  final Storage storage;

  AccountServiceImpl(this.api, this.storage);

  @override
  Future<RequestVerificationModel> requestVerification(RequestVerificationEntity entity) async {
    try {
      final response = await api.dio.post(
        ApiEndpoints.requestVerification,
        data: entity.toJson(),
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Content-type': 'application/json',
          },
        ),
      );

      return RequestVerificationModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<SigninModel> signin(SigninEntity entity) async {
    try {
      final response = await api.dio.post(
        ApiEndpoints.sigin,
        data: entity.toJson(),
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Content-type': 'application/json',
          },
        ),
      );

      final SigninModel signinModel = SigninModel.fromJson(response.data);

      await storage.saveToken(value: '${signinModel.data?.token}');

      return SigninModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<SignupModel> signup(SignupEntity entity) async {
    try {
      final response = await api.dio.post(
        ApiEndpoints.signup,
        data: entity.toJson(),
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Content-type': 'application/json',
          },
        ),
      );

      return SignupModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<VerifyEmailModel> verifyEmail(VerifyEmailEntity entity) async {
   try {
      final response = await api.dio.post(
        ApiEndpoints.verifyEmail,
        data: entity.toJson(),
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Content-type': 'application/json',
          },
        ),
      );

      return VerifyEmailModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<SignoutModel> signout() async {
    try {
      final response = await api.dio.post(
        ApiEndpoints.signout,
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Content-type': 'application/json',
          },
        ),
      );

      // await storage.clearAllStorage();

      return SignoutModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

}