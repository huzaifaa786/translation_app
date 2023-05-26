import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:translation/api/api.dart';
import 'package:translation/helper/loading.dart';
import 'package:translation/models/account.dart';
import 'package:translation/screens/main_screen/home.dart';
import 'package:translation/values/string.dart';

class AmountController extends GetxController {
  static AmountController instance = Get.find();

  String? Selectedvalue = "00";
  TextEditingController amount = TextEditingController();

  paayment() async {
    LoadingHelper.show();
    var data = await paymentIntent();
    data = jsonDecode(data.toString());
    try {
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: data['paymentIntent'],
          merchantDisplayName: 'Translation',
          googlePay: PaymentSheetGooglePay(
            merchantCountryCode: 'UAE',
            currencyCode: 'AED',
            testEnv: true,
          ),
          style: ThemeMode.dark,
          // customFlow: true
          // billingDetails: billingDetails,
        ),
      );
    } on Exception catch (e) {
      if (e is StripeException) {
        Get.snackbar('Error from Stripe: ', '${e.error.localizedMessage}',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white);

        return false;
      }
    }

    LoadingHelper.dismiss();
  }

  addbalance() async {
    LoadingHelper.show();

    var url = BASE_URL + 'balance/add';

    GetStorage box = GetStorage();
    int id = box.read('user_id');
    String api_token = box.read('api_token');

    var data;

    data = {
      'balance': int.parse(Selectedvalue!),
      'id': id,
      'api_token': api_token
    };

    var response = await Api.execute(
      url: url,
      data: data,
    );

    LoadingHelper.dismiss();
    Account account = Account(response['account']);
    update();

    Get.offAll(() => Home_screen());
    return account;
  }

  Future<bool> confirmPayment() async {
    try {
      await paayment();
      // 3. display the payment sheet.
      await Stripe.instance.presentPaymentSheet();

      addbalance();
      return true;
    } on Exception catch (e) {
      if (e is StripeException) {
        Get.snackbar('Error from Stripe: ', '${e.error.localizedMessage}',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white);

        return false;
      } else {
        Get.snackbar('Error from Stripe: ', 'Unforeseen error: ${e}',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white);

        return false;
      }
    }
  }

  paymentIntent() async {
    var url = BASE_URL + 'payment/intent';
    log(Selectedvalue!);
    var data = {'price': int.parse(Selectedvalue!)};
    var response = await Api.execute(url: url, data: data);
    return response['intent'];
  }

  clearVariables() {
    Selectedvalue = "00";
  }

  chnageAmount() {
    Selectedvalue = amount.text;
    update();
    Get.back();
  }
}
