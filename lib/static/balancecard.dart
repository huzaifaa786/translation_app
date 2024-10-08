// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:translation/screens/enter_amount/enteramount.dart';
import 'package:translation/values/colors.dart';
import 'package:translation/values/controllers.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard({
    super.key,
    this.image,
    this.balance,
    this.day,
    this.type,
    this.ontap,
    this.name,
    this.currency = "AED",
  });
  final type;
  final name;
  final image;
  final balance;
  final day;
  final ontap;
  final currency;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15, top: 15),
      width: MediaQuery.of(context).size.width,
      // height: MediaQuery.of(context).size.height*0.22,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/topUp.png"), fit: BoxFit.cover),
        //  border: Border.all(width: 1, color: greenish),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 19, 8, 5),
                    child: Text(
                      "Your Balance".tr,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Poppins'),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 5),
                    child: Text(
                      'AED'.tr,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      balance,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 85,
                        height: 33.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(29.0)),
                        ),
                        child: Center(
                          child: ElevatedButton(
                            onPressed: () {
                              amountController.clearVariables();
                              Get.to(() => Topup_screen());
                              // );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                'Top Up'.tr,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Poppins'),
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              foregroundColor: greenish,
                              minimumSize: Size(78, 26),
                              backgroundColor: Colors.white,
                              padding: EdgeInsets.zero, // Button text color
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    18.0), // Button border radius
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      name,
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins'),
                    ),
                  ),
                ],
              )
            ],
          )),
    );
  }
}
