import 'package:assesment_test/modules/utils/models/country_model.dart';
import 'package:dartz/dartz.dart';

import 'package:assesment_test/base_app/core/error/failure.dart';
import 'package:assesment_test/modules/utils/models/random_message_model.dart';
import 'package:assesment_test/modules/utils/repos/utils_repo.dart';
import 'package:assesment_test/modules/utils/services/utils_service.dart';

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