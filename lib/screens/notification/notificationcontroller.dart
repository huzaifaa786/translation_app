import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:translation/api/api.dart';
import 'package:translation/helper/loading.dart';
import 'package:translation/models/notification.dart';
import 'package:translation/values/string.dart';

class NotificationController extends GetxController {
  static NotificationController instance = Get.find();

  List<Notificationn> notifications = [];
  getnoti() async {
    LoadingHelper.show();
    var url = BASE_URL + 'user/notification';
    GetStorage box = GetStorage();

    String api_token = box.read('api_token');

    var data = {
      'api_token': api_token,
    };
    print(data);
    var response = await Api.execute(url: url, data: data);

    if (!response['error']) {
      // notifications = [];
      for (var van in response['notifications']) {
        notifications.add(Notificationn(van));
      }
      print(response);
      LoadingHelper.dismiss();
    } else {
      print(response['error']);
      LoadingHelper.dismiss();
    }
  }
}
