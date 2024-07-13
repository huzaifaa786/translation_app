import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:translation/screens/enter_amount/amountcontroller.dart';
import 'package:translation/screens/enter_amount/ppaymentmethod.dart';
import 'package:translation/static/box.dart';
import 'package:translation/static/input_field.dart';
import 'package:translation/static/large_button.dart';
import 'package:translation/static/titletopbar.dart';
import 'package:translation/values/controllers.dart';
import 'package:gap/gap.dart';
import '../../../../values/colors.dart';

class Topup_screen extends StatefulWidget {
  const Topup_screen({super.key});

  @override
  State<Topup_screen> createState() => _Topup_screenState();
}

enum payMethod { materCard, googlePay, applePay, walletpay }

class _Topup_screenState extends State<Topup_screen> {
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
        child: GetBuilder<AmountController>(
          builder: (controller) => Stack(
            children: [
              Column(
                children: [
                  TitleTopbar(
                    height: 0.14,
                    text: 'Top Up'.tr,
                    ontap: () {
                      Get.back();
                    },
                  ),
                ],
              ),
              Positioned(
                top: 100,
                right: 14,
                left: 14,
                child: Container(
                  decoration: BoxDecoration(
                    color: ggrey,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [BoxShadow(color: Colors.black, blurRadius: 10)],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          'Enter Amount'.tr,
                          style: TextStyle(
                              color: greenish,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                        Gap(10),
                        InkWell(
                          onTap: () {
                            Enteramount();
                          },
                          child: Center(
                              child: Text(
                            amountController.Selectedvalue!,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color: greenish),
                          )),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                            child: Text(
                          "AED",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                              color: Colors.black),
                        )),
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                            child: Text(
                          "or quick select amount".tr,
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w400),
                        )),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Box(
                                title: '40',
                                ontap: () {
                                  setState(() {
                                    amountController.Selectedvalue = '40';
                                  });
                                },
                                selected: amountController.Selectedvalue == '40'
                                    ? true
                                    : false,
                              ),
                              Box(
                                title: '50',
                                ontap: () {
                                  setState(() {
                                    amountController.Selectedvalue = '50';
                                  });
                                },
                                selected: amountController.Selectedvalue == '50'
                                    ? true
                                    : false,
                              ),
                              Box(
                                title: '60',
                                ontap: () {
                                  setState(() {
                                    amountController.Selectedvalue = '60';
                                  });
                                },
                                selected: amountController.Selectedvalue == '60'
                                    ? true
                                    : false,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      
                        Padding(
                          padding: const EdgeInsets.only(left: 30, right: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Payment Method".tr,
                                style: TextStyle(
                                    color: greenish,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                          const Divider(
                          thickness: 2,
                          height: 1,
                        ),
                          SizedBox(
                          height: 30,
                        ),
                        Directionality(
                          textDirection: TextDirection.ltr,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: Column(children: [
                              // PPaymentMethod(
                  
                              //   title: 'Googlepay',
                  
                              //   image: "assets/icons/googlepay.png",
                  
                              //   groupvalue: _site,
                  
                              //   value: payMethod.googlePay,
                  
                              //   onchaged: () {
                  
                              //     toggleplan(payMethod.googlePay);
                  
                              //   },
                  
                              // ),
                  
                              // PPaymentMethod(
                  
                              //   title: 'Applepay',
                  
                              //   image: "assets/icons/applepay.png",
                  
                              //   groupvalue: _site,
                  
                              //   value: payMethod.applePay,
                  
                              //   onchaged: () {
                  
                              //     toggleplan(payMethod.applePay);
                  
                              //   },
                  
                              // ),
                  
                              // PPaymentMethod(
                  
                              //   title: 'Form Wallet',
                  
                              //   image: "assets/icons/walletpay.png",
                  
                              //   groupvalue: _site,
                  
                              //   value: payMethod.walletpay,
                  
                              //   onchaged: () {
                  
                              //     toggleplan(payMethod.walletpay);
                  
                              //   },
                  
                              // ),
                  
                              PPaymentMethod(
                                title: 'Credit/visa card'.tr,
                                image: "assets/icons/visapay.png",
                                groupvalue: _site,
                                value: payMethod.materCard,
                                isSelected: _site == payMethod.materCard,
                                onchaged: () {
                                  amountController.confirmPayment();
                                },
                              ),
                            ]),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          // child: Center(
                          //     child: LargeButton(
                          //   title: 'Top Up'.tr,
                          //   sreenRatio: 0.9,
                          //   onPressed: () {
                  
                          //   },
                          //   color: greenish,
                          //   textcolor: Colors.white,
                          //   buttonWidth: 0.95,
                          // )),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Enteramount() {
    Alert(
        context: context,
        title: "Enter your amount".tr,
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 6),
            Text(
              "Enter amount".tr,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
            SizedBox(height: 4),
            InputField(
              hint: "Enter your amount".tr,
              controller: amountController.amount,
              type: TextInputType.number,
            ),
          ],
        ),
        buttons: [
          DialogButton(
            color: greenish,
            onPressed: () async {
              amountController.chnageAmount();
            },
            child: Text(
              "ADD".tr,
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          )
        ]).show();
  }
}
