import 'package:smartpay/modules/utils/models/country_model.dart';
import 'package:dartz/dartz.dart';

import 'package:smartpay/base_app/core/error/failure.dart';
import 'package:smartpay/modules/utils/models/random_message_model.dart';
import 'package:smartpay/modules/utils/repos/utils_repo.dart';
import 'package:smartpay/modules/utils/services/utils_service.dart';

class UtilsRepoImpl implements UtilsRepo {
  final UtilsService srv;

  UtilsRepoImpl(this.srv);

  @override
  Future<Either<Failure, RandomMessageModel>> fetchDashbaordInfo() async {
    try {
      return Right(await srv.dashbaordInfo());
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CountryModel>>> fetchCountries() async {
    try {
      return Right(await srv.fetchCountries());
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}