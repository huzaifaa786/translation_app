import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:translation/api/api.dart';
import 'package:translation/helper/loading.dart';
import 'package:translation/screens/translator/translator_profile_controller.dart';
import 'package:translation/values/controllers.dart';
import 'package:translation/values/string.dart';

class CheckOutController extends GetxController {
  static CheckOutController instance = Get.find();

  paymentIntent() async {
    var url = BASE_URL + 'payment/intent';
    var data = {'price': translatorProfileController.totalAmount};
    var response = await Api.execute(url: url, data: data);
    return response['intent'];
  }

  Future<bool> confirmPayment() async {
    try {
      await paayment();
      // 3. display the payment sheet.
      await Stripe.instance.presentPaymentSheet();
      translatorProfileController.scheduleType == ScheduleType.InPerson
          ? translatorProfileController.InpersonplaceOrder(
              translatorProfileController.vendors)
          : translatorProfileController
              .placeOrder(translatorProfileController.vendors);
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
}
