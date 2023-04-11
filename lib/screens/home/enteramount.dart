import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:translation/screens/home/setting.dart';
import 'package:translation/static/large_button.dart';

import '../../../../values/colors.dart';

class Topup_screen extends StatefulWidget {
  const Topup_screen({super.key});

  @override
  State<Topup_screen> createState() => _Topup_screenState();
}

class _Topup_screenState extends State<Topup_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Setting_screen()));
                      },
                      child: SvgPicture.asset("assets/icons/back.svg")),
                  SizedBox(
                    width: 100,
                  ),
                  Text(
                    "Enter amount",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
                child: Text(
              "00",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 31),
            )),
            SizedBox(
              height: 10,
            ),
            Center(
                child: Text(
              "AED",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            )),
            SizedBox(
              height: 20,
            ),
            Center(
                child: Text(
              "Enter an amount from AED-AED 250",
              style: TextStyle(fontSize: 17),
            )),
            SizedBox(
              height: 20,
            ),
            Center(
                child: Text(
              "or quick select amount",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            )),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(15, 15, 0, 15),
                    width: 109,
                    height: 40,
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          color: Color.fromRGBO(0, 0, 0, 0.24), width: 1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(
                        '40',
                        textDirection: TextDirection.rtl,
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(5, 15, 0, 15),
                    width: 109,
                    height: 40,
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          color: Color.fromRGBO(0, 0, 0, 0.24), width: 1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(
                        '50',
                        textDirection: TextDirection.rtl,
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(5, 15, 0, 15),
                    width: 109,
                    height: 40,
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          color: Color.fromRGBO(0, 0, 0, 0.24), width: 1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(
                        '60',
                        textDirection: TextDirection.rtl,
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                children: [
                  Text(
                    "Payment Method",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                children: [
                  SvgPicture.asset("assets/icons/google.svg"),
                  SizedBox(
                    width: 25,
                  ),
                  Text("Googlepay"),
                  SizedBox(
                    width: 150,
                  ),
                  Radio(
                    value: 1,
                    groupValue: 0,
                    onChanged: (newValue) {
                      setState(() {
                        // _character = newValue;
                      });
                    },
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                children: [
                  SvgPicture.asset("assets/icons/apple.svg"),
                  SizedBox(
                    width: 25,
                  ),
                  Text("Applepay"),
                  SizedBox(
                    width: 165,
                  ),
                  Radio(
                    value: 1,
                    groupValue: 0,
                    onChanged: (newValue) {
                      setState(() {
                        // _character = newValue;
                      });
                    },
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                children: [
                  SvgPicture.asset("assets/icons/wallet.svg"),
                  SizedBox(
                    width: 30,
                  ),
                  Text("Wallet"),
                  SizedBox(
                    width: 185,
                  ),
                  Radio(
                    value: 1,
                    groupValue: 0,
                    onChanged: (newValue) {
                      setState(() {
                        // _character = newValue;
                      });
                    },
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 45),
              child: Row(
                children: [
                  SvgPicture.asset("assets/icons/visa.svg"),
                  Text("Visacard"),
                  SizedBox(
                    width: 172,
                  ),
                  Radio(
                    value: 1,
                    groupValue: 0,
                    onChanged: (newValue) {
                      setState(() {
                        // _character = newValue;
                      });
                    },
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                  child: LargeButton(
                title: 'Top Up',
                sreenRatio: 0.9,
                onPressed: () {
                  setState(() {});

                  // authController.signIn();
                  // Navigator.pushReplacement(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => CardAdded_Screen(),
                  //     ));
                },
                color: greenish,
                textcolor: Colors.white,
                buttonWidth: 0.95,
              )),
            ),
          ],
        ),
      ),
    );
  }
}
