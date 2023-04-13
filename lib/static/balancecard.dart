// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:translation/screens/home/enteramount.dart';
import 'package:translation/values/colors.dart';
import 'package:translation/static/bagee.dart';

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
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 23, top: 15),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
              color: greenish,
              border: Border.all(
                width: 1,
                color: Color.fromRGBO(0, 0, 0, 0.17),
              ),
              borderRadius: BorderRadius.circular(19),
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
                            "Your Balance",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Mazzard'),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8,top: 5),
                          child: Text(
                            "AED ",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Mazzard'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text(
                            balance,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontFamily: 'Mazzard',
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
                            style: TextStyle(fontSize: 16, color: Colors.white,fontWeight: FontWeight.w500),
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
                                  // Add your button's onPressed function here
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Topup_screen()),
                                  );
                                },
                                child: Text(
                                  'Top Up',
                                  style: TextStyle(fontSize: 16,fontWeight:FontWeight.w500),
                                ),
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(78, 26),
                                  padding: EdgeInsets.zero,
                                  primary:
                                      Colors.white, // Button background color
                                  onPrimary: greenish, // Button text color
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
          ),
        ),
      ],
    );
  }
}
