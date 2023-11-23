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
  });
  final type;
  final name;
  final image;
  final balance;
  final day;
  final ontap;

  @override
  Widget build(BuildContext context) {
    return Container(
              margin: const EdgeInsets.only(left: 15, right: 15,top: 15),

      width: MediaQuery.of(context).size.width  
,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/topUp.png"),
            fit: BoxFit.fill),
        border: Border.all(
          width: 1,
          color: Color.fromRGBO(0, 0, 0, 0.17),
        ),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 8, 8, 5),
                    child: Text(
                      "Your Balance".tr,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Lato'),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8, top: 5),
                    child: Text(
                      "AED ",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Merriweather'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      balance,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontFamily: 'Merriweather',
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      name,
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins'),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 100,
                      height: 40.0,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.all(Radius.circular(8.0)),
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
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Lato'),
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            foregroundColor: greenish, minimumSize: Size(78, 26), backgroundColor: Colors.white,
                            padding: EdgeInsets.zero, // Button text color
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  8.0), // Button border radius
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          )),
    );
  }
}
