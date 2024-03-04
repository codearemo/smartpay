import 'package:smartpay/base_app/core/error/failure.dart';
import 'package:smartpay/modules/account/entities/request_verification_entity.dart';
import 'package:smartpay/modules/account/entities/signin_entity.dart';
import 'package:smartpay/modules/account/entities/signup_entity.dart';
import 'package:smartpay/modules/account/entities/verify_email_entity.dart';
import 'package:smartpay/modules/account/models/signin_model.dart';
import 'package:smartpay/modules/account/models/signout_model.dart';
import 'package:smartpay/modules/account/models/signup_model.dart';
import 'package:smartpay/modules/account/models/verification_request_model.dart';
import 'package:smartpay/modules/account/models/verify_email_model.dart';
import 'package:dartz/dartz.dart';

abstract class AccountRepo {
  Future<Either<Failure, SignoutModel>> signout();
  Future<Either<Failure, SigninModel>> signin(SigninEntity entity);
  Future<Either<Failure, SignupModel>> signup(SignupEntity entity);
  Future<Either<Failure, RequestVerificationModel>> requestVerification(RequestVerificationEntity entity);
  Future<Either<Failure, VerifyEmailModel>> verifyEmail(VerifyEmailEntity entity);
}