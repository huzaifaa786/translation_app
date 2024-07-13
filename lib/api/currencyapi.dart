import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:translation/values/string.dart';

class ApiService {
  Future<Response> storeCurrency(String Currency) async {
    var url = BASE_URL + 'user/currency/store';
    GetStorage box = GetStorage();

    // final url = 'https://translation.ezmoveportal.com/api/user/currency/store';
    print(box.read('api_token'));
    var data = {'api_token': box.read('api_token'), 'currency': Currency};

    try {
      final response = await Dio().post(url, data: data);
      return response;
    } catch (error) {
      print(error);
      throw Exception('Failed to store currency');
    }
  }
}
