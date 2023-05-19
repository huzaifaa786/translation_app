import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:translation/api/api.dart';
import 'package:translation/helper/loading.dart';
import 'package:translation/values/language.dart';
import 'package:translation/values/string.dart';

class HomeController extends GetxController {
  static HomeController instance = Get.find();

  String? fromSelectedLanguage;
  String? toSelectedLanguage;

  void online() async {
    LoadingHelper.show();
    var url = BASE_URL + 'vendor/get';

    var data = {
      'form': fromSelectedLanguage,
      'to': toSelectedLanguage,
    };
    var response = await Api.execute(url: url, data: data);
    print(response);
    LoadingHelper.dismiss();
    return response;
  }
}
