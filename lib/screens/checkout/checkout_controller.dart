import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:translation/api/api.dart';
import 'package:translation/helper/loading.dart';
import 'package:translation/models/account.dart';
import 'package:translation/models/coupon.dart';
import 'package:translation/screens/translator/translator_profile_controller.dart';
import 'package:translation/values/controllers.dart';
import 'package:translation/values/string.dart';

class CheckOutController extends GetxController {
  static CheckOutController instance = Get.find();
  int balance = 0;
  String? percentage = '0';
  String? amountDeducted = '0';
  TextEditingController coupon = TextEditingController();
  clear() {
    coupon.clear();
    update();
  }

  // List<Coupon> coupons = [];
  paymentIntent() async {
    var url = BASE_URL + 'payment/intent';
    var data = {'price': translatorProfileController.CheckoutAmount};
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

  Coupon? coupons;
  getcoupon(void Function(bool) callback) async {
    LoadingHelper.show();
    var url = BASE_URL + 'getcoupon';
    var data;
    GetStorage box = GetStorage();
    print(box.read('api_token'));
    data = {
      'api_token': box.read('api_token')!,
      'coupon': coupon.text.toString()
    };
    var response = await Api.execute(url: url, data: data);
    if (!response['error']) {
      coupons = Coupon(response['coupons']);

      LoadingHelper.dismiss();
      Get.snackbar('You have successfully applied the promo code', '',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
      update();
      return callback(true);
    } else {
      LoadingHelper.dismiss();
      print(response['error_data']);
      Get.snackbar('Invalid Promo Code', '',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
      return callback(false);
    }
  }

  discount(totalAmount) {
    var per = int.parse(coupons!.percentage!) / 100;
    var discount = per * int.parse(totalAmount);
    print(discount);
    print(double.parse(coupons!.maximum!));
    if (discount <= double.parse(coupons!.maximum!)) {
      amountDeducted = discount.toStringAsFixed(0);
      var amount = int.parse(amountDeducted!);
      var totalp = int.parse(totalAmount) - amount;
      totalAmount = totalp.toString();
      percentage = coupons!.percentage!;
      update();
      translatorProfileController.CheckoutAmount = int.parse(totalAmount);
      print(translatorProfileController.totalAmount);
      print(translatorProfileController.CheckoutAmount);
      LoadingHelper.dismiss();
    } else {
      var per = int.parse(coupons!.maximum!) / int.parse(totalAmount);
      // percentage = per.toStringAsFixed(3);
      var discount = per * 100;
      percentage = discount.toStringAsFixed(2);
      var perVal = double.parse(percentage.toString()) / 100;
      var discountval = perVal * double.parse(totalAmount);
      amountDeducted = discountval.toStringAsFixed(0);
      var amount = int.parse(amountDeducted!);
      var totalp = int.parse(totalAmount) - amount;
      totalAmount = totalp.toInt();
      update();
      translatorProfileController.CheckoutAmount = totalAmount;
      print(translatorProfileController.totalAmount);
      print(translatorProfileController.CheckoutAmount);
      translatorProfileController.refresh();
      LoadingHelper.dismiss();
    }
  }

  Account? account;
  getbalance() async {
    LoadingHelper.show();
    var url = BASE_URL + 'balance/get';
    GetStorage box = GetStorage();
    int id = box.read('user_id');
    print(box.read('api_token'));
    var data = {'id': id, 'api_token': box.read('api_token')};
    var response = await Api.execute(url: url, data: data);
    print(response);
    LoadingHelper.dismiss();
    account = Account(response['balance']);
  }

  substractbalance(totalAmount) async {
    LoadingHelper.show();
    var url = BASE_URL + 'balancesubtract';
    GetStorage box = GetStorage();
    int id = box.read('user_id');
    print(box.read('api_token'));
    var data = {
      'id': id,
      'api_token': box.read('api_token'),
      'balance': totalAmount
    };
    var response = await Api.execute(url: url, data: data);
    print(response);
    LoadingHelper.dismiss();
  }
}
