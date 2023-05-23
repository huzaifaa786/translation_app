import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:translation/api/api.dart';
import 'package:translation/helper/loading.dart';
import 'package:translation/models/account.dart';
import 'package:translation/values/string.dart';

class AmountController extends GetxController {
  static AmountController instance = Get.find();

  String? Selectedvalue = "00";

  paayment() async {
    LoadingHelper.show();
    print('dsfsdfsdfdsfsdfsdfds');
    print(Selectedvalue);
    var data = await addbalance(Selectedvalue);

    data = jsonDecode(data.toString());
    print('sdsa');
    print(data['paymentIntent']);
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: data['paymentIntent'],
        merchantDisplayName: 'Translation',

        applePay: PaymentSheetApplePay(merchantCountryCode: 'UAE'),
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
    LoadingHelper.dismiss();
    // confirmPayment();
  }

  addbalance(Selectedvalue) async {
    LoadingHelper.show();

    var url = BASE_URL + 'balance/add';

    GetStorage box = GetStorage();
    int id = box.read('user_id');
    print('user_id');
    var data;

    data = {'balance': int.parse(Selectedvalue), 'id': id};

    var response = await Api.execute(
      url: url,
      data: data,
    );
    print(response);
    LoadingHelper.dismiss();
    Account account = Account(response['account']);
    return account;
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
