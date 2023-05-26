import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:translation/api/api.dart';
import 'package:translation/helper/loading.dart';
import 'package:translation/models/account.dart';
import 'package:translation/values/string.dart';

class SettingController extends GetxController {
  static SettingController instance = Get.find();
  int balance = 0;
  XFile? bugImage = XFile('');
  TextEditingController bugcontroller = TextEditingController();

  Future<void> selectbugImage() async {
    final ImagePicker _picker = ImagePicker();
    var image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      bugImage = image;
      update();
    }
  }

  ClearbugVariables() {
    bugcontroller.clear();
  }

  void getbalance() async {
    LoadingHelper.show();
    var url = BASE_URL + 'balance/get';
    GetStorage box = GetStorage();
    int id = box.read('user_id');
    print('user_id');
    var data = {
      'id': id,
    };
    var response = await Api.execute(url: url, data: data);
    print(response);
    LoadingHelper.dismiss();
    Account account = Account(response['balance']);
    print(account.balance);

    balance = account.balance!;
    update();
  }

  void addbug() async {
    LoadingHelper.show();
    if (bugImage!.path != '') {
      final bugpic = base64Encode(File(bugImage!.path).readAsBytesSync());
      var url = BASE_URL + 'add/bug';
      GetStorage box = GetStorage();
      int id = box.read('user_id');
      print(id);
      var data = {
        'user_id': id,
        'picture': bugpic,
        'bug': bugcontroller.text.toString()
      };
      var response = await Api.execute(url: url, data: data);
      print(response);

      LoadingHelper.dismiss();
      ClearbugVariables();
      update();
    }
  }
}
