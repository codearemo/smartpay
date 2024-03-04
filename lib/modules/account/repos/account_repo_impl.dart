import 'package:assesment_test/base_app/core/error/failure.dart';
import 'package:assesment_test/modules/account/entities/request_verification_entity.dart';
import 'package:assesment_test/modules/account/entities/signin_entity.dart';
import 'package:assesment_test/modules/account/entities/signup_entity.dart';
import 'package:assesment_test/modules/account/entities/verify_email_entity.dart';
import 'package:assesment_test/modules/account/models/signin_model.dart';
import 'package:assesment_test/modules/account/models/signout_model.dart';
import 'package:assesment_test/modules/account/models/signup_model.dart';
import 'package:assesment_test/modules/account/models/verification_request_model.dart';
import 'package:assesment_test/modules/account/models/verify_email_model.dart';
import 'package:assesment_test/modules/account/repos/account_repo.dart';
import 'package:assesment_test/modules/account/services/account_service.dart';
import 'package:dartz/dartz.dart';

class AccountRepoImpl implements AccountRepo {
  final AccountService srv;

  AccountRepoImpl(this.srv);

  @override
  Future<Either<Failure, RequestVerificationModel>> requestVerification(
      RequestVerificationEntity entity) async {
    try {
      return Right(await srv.requestVerification(entity));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, SigninModel>> signin(SigninEntity entity) async {
    try {
      return Right(await srv.signin(entity));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, SignoutModel>> signout() async {
    try {
      return Right(await srv.signout());
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, SignupModel>> signup(SignupEntity entity) async {
    try {
      return Right(await srv.signup(entity));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, VerifyEmailModel>> verifyEmail(
      VerifyEmailEntity entity) async {
    try {
      return Right(await srv.verifyEmail(entity));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
