import 'package:smartpay/modules/utils/models/country_model.dart';
import 'package:smartpay/modules/utils/models/random_message_model.dart';

abstract class UtilsService {
  Future<RandomMessageModel> dashbaordInfo();
  Future<List<CountryModel>> fetchCountries();
}