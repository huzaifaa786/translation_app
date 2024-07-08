import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:translation/screens/checkout/checkout_controller.dart';
import 'package:translation/screens/enter_amount/ppaymentmethod.dart';
import 'package:translation/screens/main_screen/homecontroller.dart';
import 'package:translation/screens/setting/settingcontroller.dart';
import 'package:translation/screens/translator/translator_profile_controller.dart';
import 'package:translation/static/titletopbar.dart';
import 'package:translation/values/controllers.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
  SettingController currencycontroller = Get.find();
  GetStorage box = GetStorage();
  String? selectedCurrency;
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
    selectedCurrency = box.read('selectedCurrency');
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
    return Scaffold(
      backgroundColor: ggrey,
        body: SafeArea(
          
      child: GetBuilder<HomeController>(
        builder: (homeController) => GetBuilder<TranslatorProfileController>(
          builder: (translatorProfileController) =>
              GetBuilder<CheckOutController>(
            builder: (controller) => SingleChildScrollView(
                child: Column(
              children: [
                Stack(
                  children: [
                    TitleTopbar(
                      height: 0.12,
                      text: 'Checkout'.tr,
                      ontap: () {
                        Get.back();
                      },
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width * 0.59,
                      margin: EdgeInsets.only(top: 83, left: 16, right: 16),
                      decoration: BoxDecoration(
                          color: ggrey,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey[500]!,
                              blurRadius: 2,
                              offset: Offset(0.00001, 3),
                            ),
                          ]),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 14,
                          ),
                          Text(
                            "Service Detail".tr,
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                color: greenish),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                  'assets/images/Online Support.svg'),
                              Text(
                                'Translator:  ',
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                    color: greenish),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Column(
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: translatorProfileController
                                              .vendors!.profilePic !=
                                          ''
                                      ? Image.network(
                                          translatorProfileController
                                              .vendors!.profilePic
                                              .toString(),
                                          fit: BoxFit.cover,
                                        )
                                      : Image.asset(
                                          'assets/images/5907.jpg',
                                          height: 33,
                                          width: 33,
                                        )),
                              SizedBox(
                                height: 5,
                              ),
                              Center(
                                child: Text(
                                  translatorProfileController.vendors!.name !=
                                          ''
                                      ? translatorProfileController
                                          .vendors!.name
                                          .toString()
                                      : '',
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/icons/Service (2).png'),
                              Text(
                                ' Type Of Service:',
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                    color: greenish),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Center(
                            child: Text(
                              // translatorProfileController.serviceType ==
                              //         ServiceType.Instant
                              //     ? 'Instant audio/video meeting'.tr
                              //     :
                              translatorProfileController.scheduleType ==
                                      ScheduleType.DocumentType
                                  ? 'Document translation'.tr
                                  : translatorProfileController.scheduleType ==
                                          ScheduleType.AudioVideo
                                      ? 'Audio/video meeting'.tr
                                      : 'In person meeting'.tr,
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.w500),
                            ),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.calendar_month),
                                      Text('Date',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700)),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                      DateFormat('dd/MM/yyyy').format(
                                          translatorProfileController
                                              .selectedDay.value),
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: greenish)),
                                ],
                              ),
                              SizedBox(
                                width: 13,
                              ),
                              translatorProfileController.scheduleType !=
                                      ScheduleType.DocumentType
                                  ? Column(
                                      children: [
                                        Row(
                                          children: [
                                            Icon(Icons.timer_outlined),
                                            Text('Time',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w700)),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        translatorProfileController
                                                    .serviceType !=
                                                ServiceType.Document
                                            ? translatorProfileController
                                                        .serviceType !=
                                                    ServiceType.Schedule
                                                ? Text(
                                                    translatorProfileController
                                                            .duration
                                                            .toString() +
                                                        ' min',
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: greenish))
                                                : Text(
                                                    translatorProfileController
                                                            .startTime +
                                                        ' - ' +
                                                        translatorProfileController
                                                            .endTime,
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: greenish))
                                            : Container(),
                                      ],
                                    )
                                  : Container()
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Column(children: [
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
                            contentPadding:
                                EdgeInsets.only(left: 12, right: 12, top: 14),
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
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 16),
                                      child: Text('Apply',style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500),),
                                    ))
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
                      padding: const EdgeInsets.only(left: 29, right: 29),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("SubTotal".tr,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: greenish)),
                        Text(
                            translatorProfileController.CheckoutAmount
                                    .toString() +
                                "${selectedCurrency != null ? currencycontroller.selectedCurrency : " AED "}",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 29, right: 29, top: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Total".tr,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: greenish)),
                          Text(
                            translatorProfileController.CheckoutAmount
                                    .toString() +
                                "${selectedCurrency != null ? currencycontroller.selectedCurrency : " AED "}",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),

                          // Text(
                          //   "selectedCurrency" +
                          //       translatorProfileController.CheckoutAmount
                          //           .toString(),
                          //   style: TextStyle(
                          //       fontSize: 16, fontWeight: FontWeight.w600),
                          // )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Payment Method".tr,
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    PPaymentMethod(
                      title: 'Credit/visa card'.tr,
                      image: "assets/icons/visapay.png",
                      groupvalue: _site,
                      value: payMethod.materCard,
                      isSelected: _site == payMethod.materCard,
                      onchaged: () {
                        toggleplan(payMethod.materCard);
                      },
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    PPaymentMethod(
                      title: 'From Wallet'.tr,
                      image: "assets/icons/walletpay.png",
                      groupvalue: _site,
                      isSelected: _site == payMethod.walletpay,
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
                            Get.snackbar(
                                '',
                                'You may need to select location to get translator inperson service.'
                                    .tr,
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
    ));
  }
}
