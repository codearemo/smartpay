import 'package:smartpay/base_app/core/error/failure.dart';
import 'package:smartpay/modules/utils/models/country_model.dart';
import 'package:smartpay/modules/utils/models/random_message_model.dart';
import 'package:dartz/dartz.dart';

abstract class UtilsRepo {
  Future<Either<Failure, RandomMessageModel>> fetchDashbaordInfo();
  Future<Either<Failure, List<CountryModel>>> fetchCountries();
}