import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:translation/screens/checkout/checkout_controller.dart';
import 'package:translation/screens/enter_amount/ppaymentmethod.dart';
import 'package:translation/screens/main_screen/homecontroller.dart';
import 'package:translation/screens/translator/translator_profile_controller.dart';
import 'package:translation/static/titletopbar.dart';
import 'package:translation/values/controllers.dart';
import 'dart:ui' as ui;
import '../../../../values/colors.dart';
import '../../../../static/large_button.dart';

class Checkout_screen extends StatefulWidget {
  const Checkout_screen({super.key, required this.totalAmount});
  final String totalAmount;
  @override
  State<Checkout_screen> createState() => _Checkout_screenState();
}

enum payMethod { materCard, walletpay }

class _Checkout_screenState extends State<Checkout_screen> {
  payMethod _site = payMethod.materCard;
  bool readonly = false;
  void toggleplan(payMethod value) {
    setState(() {
      _site = value;
    });
  }

  getbalance() async {
    await checkoutController.getbalance();
    setState(() {});
  }

  @override
  void initState() {
    getbalance();
    print(widget.totalAmount);
    super.initState();
  }

  substractbalance() {
    checkoutController.substractbalance(widget.totalAmount);
  }

  walletpayment() {
    if (checkoutController.account!.balance! < int.parse(widget.totalAmount)) {
      Get.snackbar("Balance low", 'Order amount is greater then your balance',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    } else {
      translatorProfileController
          .placeOrder(translatorProfileController.vendors);
      substractbalance();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
       textDirection: ui.TextDirection.ltr,
      child: Scaffold(
          body: SafeArea(
        child: GetBuilder<HomeController>(
          builder: (homeController) => GetBuilder<TranslatorProfileController>(
            builder: (translatorProfileController) =>
                GetBuilder<CheckOutController>(
              builder: (controller) => SingleChildScrollView(
                  child: Column(
                children: [
                  TitleTopbar(
                    text: 'Checkout'.tr,
                    ontap: () {
                      Get.back();
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 12, bottom: 10),
                        child: Text(
                          "Service Detail".tr,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(8),
                        width: 98,
                        height: 98,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border.all(width: 2, color: Color(0xFF34607B)),
                          borderRadius: BorderRadius.circular(70),
                        ),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(70),
                            child:
                                translatorProfileController.vendors!.profilePic !=
                                        ''
                                    ? Image.network(
                                        translatorProfileController
                                            .vendors!.profilePic
                                            .toString(),
                                        fit: BoxFit.cover,
                                      )
                                    : Image.asset('assets/images/5907.jpg')),
                      ),
                      Center(
                        child: Text(
                          // translatorProfileController.serviceType ==
                          //         ServiceType.Instant
                          //     ? 'Instant audio/video meeting'.tr
                          //     : 
                              translatorProfileController.serviceType ==
                                      ServiceType.Document
                                  ? 'Document translation'.tr
                                  : translatorProfileController.scheduleType ==
                                          ScheduleType.AudioVideo
                                      ? 'Audio/video meeting'.tr
                                      : 'In person meeting'.tr,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: translatorProfileController.serviceType !=
                                ServiceType.Document
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  translatorProfileController.serviceType !=
                                          ServiceType.Document
                                      ? translatorProfileController.serviceType !=
                                              ServiceType.Schedule
                                          ? Text(
                                              "Time:   " +
                                                  translatorProfileController
                                                      .duration
                                                      .toString() +
                                                  ' min',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  color: hintText))
                                          : Text(
                                              "Time:   " +
                                                  translatorProfileController
                                                      .startTime +
                                                  ' - ' +
                                                  translatorProfileController
                                                      .endTime,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  color: hintText))
                                      : Container(),
                                  translatorProfileController.serviceType !=
                                          ServiceType.Document
                                      ? Text(" |",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              color: hintText))
                                      : Container(),
                                  Text(
                                      "   Date:    " +
                                          DateFormat('dd/MM/yyyy').format(
                                              translatorProfileController
                                                  .selectedDay.value),
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: hintText)),
                                ],
                              )
                            : Text(
                                "   Date:    " +
                                    DateFormat('dd/MM/yyyy').format(
                                        translatorProfileController
                                            .selectedDay.value),
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: hintText)),
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
                            controller: checkoutController.coupon,
                            readOnly: readonly,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left: 12, top: 14),
                              hintText: 'Promo Code'.tr,
                              // suffixIcon:Text('dfd');
                              suffixIcon: readonly != true
                                  ? InkWell(
                                      onTap: () {
                                        setState(() {});
                                        if (checkoutController.coupon.text !=
                                            '') {
                                          checkoutController.getcoupon((success) {
                                            readonly = true;
                                            if (success) {
                                              checkoutController
                                                  .discount(widget.totalAmount);
                                            }
                                          });
                                        } else {
                                          readonly = false;
                                          Get.snackbar('Error!',
                                              "Coupon doesn't apply on empty field.",
                                              snackPosition: SnackPosition.BOTTOM,
                                              backgroundColor: Colors.red,
                                              colorText: white);
                                        }
                                      },
                                      child: Icon(Icons.check))
                                  : InkWell(
                                      onTap: () {
                                        readonly = false;
                                        translatorProfileController
                                                .CheckoutAmount =
                                            int.parse(widget.totalAmount);
                                        checkoutController.coupon.text = '';
                                        setState(() {});
                                      },
                                      child: Icon(
                                        Icons.close_outlined,
                                        color: Colors.red,
                                      )),
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
                            Text("SubTotal".tr,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: hintText)),
                            Text(
                              "AED " + widget.totalAmount.toString(),
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 4, right: 4, top: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Total".tr,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: greenish)),
                            Text(
                              "AED " +
                                  translatorProfileController.CheckoutAmount
                                      .toString(),
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
                            "Payment Method".tr,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      PPaymentMethod(
                        title: 'Credit/visa card'.tr,
                        image: "assets/icons/visapay.png",
                        groupvalue: _site,
                        value: payMethod.materCard,
                        onchaged: () {
                          toggleplan(payMethod.materCard);
                        },
                      ),
                      PPaymentMethod(
                        title: 'From Wallet'.tr,
                        image: "assets/icons/walletpay.png",
                        groupvalue: _site,
                        value: payMethod.walletpay,
                        onchaged: () {
                          toggleplan(payMethod.walletpay);
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Center(
                          child: LargeButton(
                        title: 'Next'.tr,
                        sreenRatio: 0.9,
                        onPressed: () {
                          if (translatorProfileController.scheduleType ==
                              ScheduleType.InPerson) {
                            if (translatorProfileController.selectedLocation ==
                                null) {
                              Get.snackbar('Error!',
                                  'You may need to select location to get translator inperson service.',
                                  backgroundColor: Colors.red,
                                  colorText: white,
                                  snackPosition: SnackPosition.BOTTOM);
                            } else {
                              if (_site == payMethod.walletpay) {
                                walletpayment();
                              } else {
                                translatorProfileController.scheduleType ==
                                        ScheduleType.InPerson
                                    ? translatorProfileController
                                        .InpersonplaceOrder(
                                            translatorProfileController.vendors)
                                    : translatorProfileController.placeOrder(
                                        translatorProfileController.vendors);
                                ;
                              }
                            }
                          } else {
                            if (_site == payMethod.walletpay) {
                              walletpayment();
                            } else {
                              translatorProfileController.scheduleType ==
                                      ScheduleType.InPerson
                                  ? translatorProfileController
                                      .InpersonplaceOrder(
                                          translatorProfileController.vendors)
                                  : translatorProfileController.placeOrder(
                                      translatorProfileController.vendors);
                              // checkoutController.confirmPayment();
                            }
                          }
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
        ),
      )),
    );
  }
}
