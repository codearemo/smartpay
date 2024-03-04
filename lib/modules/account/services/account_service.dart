import 'package:smartpay/modules/account/entities/request_verification_entity.dart';
import 'package:smartpay/modules/account/entities/signin_entity.dart';
import 'package:smartpay/modules/account/entities/signup_entity.dart';
import 'package:smartpay/modules/account/entities/verify_email_entity.dart';
import 'package:smartpay/modules/account/models/signin_model.dart';
import 'package:smartpay/modules/account/models/signout_model.dart';
import 'package:smartpay/modules/account/models/signup_model.dart';
import 'package:smartpay/modules/account/models/verification_request_model.dart';
import 'package:smartpay/modules/account/models/verify_email_model.dart';

abstract class AccountService {
  Future<SigninModel> signin(SigninEntity entity);
  Future<SignupModel> signup(SignupEntity entity);
  Future<SignoutModel> signout();
  Future<VerifyEmailModel> verifyEmail(VerifyEmailEntity entity);
  Future<RequestVerificationModel> requestVerification(RequestVerificationEntity entity);
}
