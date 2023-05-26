import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:translation/api/api.dart';
import 'package:translation/helper/loading.dart';
import 'package:translation/models/order.dart';
import 'package:translation/values/string.dart';

class OrderController extends GetxController {
  static OrderController instance = Get.find();
  List<Order> orders = [];
  getorder() async {
    LoadingHelper.show();
    var url = BASE_URL + 'order/get';
    GetStorage box = GetStorage();
    int id = box.read('user_id');
    String api_token = box.read('api_token');
    var data = {
      'api_token': api_token,
      'user_id': id,
    };
   print(data);
    var response = await Api.execute(url: url, data: data);
    
    if (!response['error']) {
      List<Order> order = <Order>[];
      for (var van in response['order']) {
        order.add(Order(van));
      }
      orders = order;
       LoadingHelper.dismiss();
      print(orders);
      update();
    } else {
      print(response['error']);
    }
  }
}
