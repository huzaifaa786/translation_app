import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:translation/api/api.dart';
import 'package:translation/helper/loading.dart';
import 'package:translation/models/account.dart';
import 'package:translation/values/string.dart';

class SettingController extends GetxController {
  static SettingController instance = Get.find();
  int balance = 0;
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
    balance = account.balance!;
  }
  


    Future<bool> confirmPayment() async {
    print("Asdfasdfsdfasfd");

    try {
      // 3. display the payment sheet.
      await Stripe.instance.presentPaymentSheet();
      print('object');

      // Fluttertoast.showToast(msg: 'Payment succesfully completed');
      // addbalance();
      return true;
    } on Exception catch (e) {
      if (e is StripeException) {
        print('adsfasdfasdfadsfadsfa');
        // Fluttertoast.showToast(
        //     msg: 'Error from Stripe: ${e.error.localizedMessage}');
        return false;
      } else {
        // Fluttertoast.showToast(msg: 'Unforeseen error: ${e}');
        return false;
      }
    }
  }
}
