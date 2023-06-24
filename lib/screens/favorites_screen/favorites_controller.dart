import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:translation/api/api.dart';
import 'package:translation/helper/loading.dart';
import 'package:translation/models/fav.dart';
import 'package:translation/values/string.dart';

class FavController extends GetxController{
  static FavController instance = Get.find();
  List<Favorites> Fav = [];


  getFav() async {
    LoadingHelper.show();
    var url = BASE_URL + 'get/favorities';
    GetStorage box = GetStorage();

    String api_token = box.read('api_token');

    var data = {
      'api_token': api_token,
    };
    print(data);
    var response = await Api.execute(url: url, data: data);

    if (!response['error']) {
      Fav = [];
      for (var van in response['vendors']) {
        Fav.add(Favorites(van));
      }
      print(response);
      LoadingHelper.dismiss();
    } else {
      print(response['error']);
      LoadingHelper.dismiss();
    }
  }
}