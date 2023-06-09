import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:translation/screens/checkout/checkout_controller.dart';
import 'package:translation/screens/enter_amount/ppaymentmethod.dart';
import 'package:translation/screens/translator/translator_profile_controller.dart';
import 'package:translation/screens/translator_screens/translator_screen.dart';
import 'package:translation/screens/order_confirm.dart/cardAdded.dart';
import 'package:translation/static/titletopbar.dart';
import 'package:translation/values/controllers.dart';

import '../../../../values/colors.dart';
import '../../../../static/large_button.dart';

class Checkout_screen extends StatefulWidget {
  const Checkout_screen({super.key});

  @override
  State<Checkout_screen> createState() => _Checkout_screenState();
}

enum payMethod { materCard, googlePay, applePay, walletpay }

class _Checkout_screenState extends State<Checkout_screen> {
  payMethod _site = payMethod.googlePay;
  void toggleplan(payMethod value) {
    setState(() {
      _site = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: GetBuilder<TranslatorProfileController>(
        builder: (translatorController) => GetBuilder<CheckOutController>(
          builder: (controller) => SingleChildScrollView(
              child: Column(
            children: [
              TitleTopbar(text: 'Checkout'),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 12, bottom: 10),
                    child: Text(
                      "Service detail",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(8),
                    width: 98,
                    height: 98,
                    // padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Color(0xFF34607B)),
                      borderRadius: BorderRadius.circular(70),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(70),
                      child: SvgPicture.asset(
                        "assets/images/splash_3.svg",
                        width: 98,
                        height: 98,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      translatorProfileController.scheduleType.name,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                            "Time:   " +
                                translatorController.duration.toString() +
                                ' min',
                            style: TextStyle(
                                fontWeight: FontWeight.w400, color: hintText)),
                        Text(" |",
                            style: TextStyle(
                                fontWeight: FontWeight.w400, color: hintText)),
                        Text(
                            "   Date:    " +
                                DateFormat('dd/MM/yyyy').format(
                                    translatorController.selectedDay.value),
                            style: TextStyle(
                                fontWeight: FontWeight.w400, color: hintText)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16, bottom: 16),
                    child: Card(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: greenish,
                          )),
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 12, top: 14),
                          hintText: 'Promo Code',
                          suffixIcon: Icon(Icons.copy),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 4, right: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("SubTotal ",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: hintText)),
                        Text(
                          "AED " + translatorProfileController.totalAmount.toString(),
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 4, right: 4, top: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total ",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: greenish)),
                        Text(
                          "AED " + translatorProfileController.totalAmount.toString(),
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Text(
                        "Payment Method",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  PPaymentMethod(
                    title: 'Googlepay',
                    image: "assets/icons/googlepay.png",
                    groupvalue: _site,
                    value: payMethod.googlePay,
                    onchaged: () {
                      toggleplan(payMethod.googlePay);
                    },
                  ),
                  PPaymentMethod(
                    title: 'Applepay',
                    image: "assets/icons/applepay.png",
                    groupvalue: _site,
                    value: payMethod.applePay,
                    onchaged: () {
                      toggleplan(payMethod.applePay);
                    },
                  ),
                  PPaymentMethod(
                    title: 'Form Wallet',
                    image: "assets/icons/walletpay.png",
                    groupvalue: _site,
                    value: payMethod.walletpay,
                    onchaged: () {
                      toggleplan(payMethod.walletpay);
                    },
                  ),
                  PPaymentMethod(
                    title: 'Credit/visa card',
                    image: "assets/icons/visapay.png",
                    groupvalue: _site,
                    value: payMethod.materCard,
                    onchaged: () {
                      toggleplan(payMethod.materCard);
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                      child: LargeButton(
                    title: 'Next',
                    sreenRatio: 0.9,
                    onPressed: () {
                      checkoutController.confirmPayment();

                      // authController.signIn();
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => CardAdded_Screen(),
                      //     ));
                    },
                    color: greenish,
                    textcolor: Colors.white,
                    buttonWidth: 0.95,
                  )),
                  SizedBox(height: 30)
                ]),
              ),
            ],
          )),
        ),
      ),
    ));
  }
}
