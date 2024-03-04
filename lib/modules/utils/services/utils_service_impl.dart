import 'package:assesment_test/base_app/core/api.dart';
import 'package:assesment_test/base_app/core/app_endpoints.dart';
import 'package:assesment_test/base_app/core/storage.dart';
import 'package:assesment_test/modules/utils/models/country_model.dart';
import 'package:assesment_test/modules/utils/models/random_message_model.dart';
import 'package:assesment_test/modules/utils/services/utils_service.dart';
import 'package:dio/dio.dart';

class UtilsServiceImpl implements UtilsService {
  final Api api;
  final Storage storage;

  UtilsServiceImpl(this.api, this.storage);

  @override
  Future<RandomMessageModel> dashbaordInfo() async {
    try {
      final token = await storage.getToken();

      final response = await api.dio.get(
        ApiEndpoints.dashboard,
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Content-type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );

      return RandomMessageModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<CountryModel>> fetchCountries() async {
    try {
      final Dio dio = Dio();

      final response = await dio.get(
        ApiEndpoints.countries,
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Content-type': 'application/json',
          },
        ),
      );

      List<CountryModel> countries = [];

      response.data.forEach((element) {
        countries.add(CountryModel.fromJson(element));
      });

      return countries;
    } catch (e) {
      rethrow;
    }
  }
}
