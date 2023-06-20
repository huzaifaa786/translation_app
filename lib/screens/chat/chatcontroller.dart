import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:translation/api/api.dart';
import 'package:translation/helper/loading.dart';
import 'package:translation/values/string.dart';
import 'package:get_storage/get_storage.dart';

class ChatController extends GetxController {
  static ChatController instance = Get.find();
  TextEditingController massage = TextEditingController();
  main() {
    var intValue = Random().nextInt(10);
    print('ffffffffffffffffffffffffffffffffff');
    print(intValue);
    return intValue;
  }

  sendmassage() async {
    LoadingHelper.show();
    var url = BASE_URL + 'sendMessage';
    var data;
    GetStorage box = GetStorage();
    print(box.read('api_token'));
    data = {
      'api_token': box.read('api_token')!,
      'message': massage.text.toString(),
      'type': 'user',
      'temporaryMsgId': main(),
      'id': '3',
      'file': ''
    };
    var response = await Api.execute(url: url, data: data);

    LoadingHelper.dismiss();
  }
}
