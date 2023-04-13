import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:translation/screens/translator_screens/translator_screen.dart';
import 'package:translation/screens/home/cardAdded.dart';

import '../../../../values/colors.dart';
import '../../../../static/large_button.dart';

class Checkout_screen extends StatefulWidget {
  const Checkout_screen({super.key});

  @override
  State<Checkout_screen> createState() => _Checkout_screenState();
}

class _Checkout_screenState extends State<Checkout_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(children: [
      SizedBox(
        height: 40,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Row(
          children: [
            GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Translator_()));
                },
                child: SvgPicture.asset("assets/icons/back.svg")),
            SizedBox(
              width: 100,
            ),
            Text(
              "Checkout",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
            ),
          ],
        ),
      ),
      SizedBox(
        height: 10,
      ),
      Text(
        "Service detail",
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      SizedBox(
        height: 10,
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
          borderRadius: BorderRadius.circular(22),
          child: SvgPicture.asset(
            "assets/images/splash_3.svg",
            width: 64,
            height: 64,
            fit: BoxFit.cover,
          ),
        ),
      ),
      Center(
        child: const Text(
          "Online Audio/video",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      SizedBox(
        height: 10,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 70),
        child: Row(
          children: [
            Text("Time:   01:30 mins  "),
            Text("   /"),
            Text("   Date:    11/03/2024"),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 80,
          width: 900,
          padding: EdgeInsets.only(left: 9),
          child: Card(
            color: Color.fromRGBO(255, 255, 255, 1),
            margin: EdgeInsets.fromLTRB(15, 5, 15, 5),
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Color.fromARGB(255, 156, 146, 146),
                )),
            child: Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: greenish,
                      width: 1,
                    ),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                  width: 316,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Promo Code',
                      suffixIcon: Icon(Icons.copy),
                      border: InputBorder.none,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 30),
        child: Row(
          children: [
            Text("SubTotal "),
            SizedBox(
              width: 240,
            ),
            Text("RS47.60")
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
            Text("Total "),
            SizedBox(
              width: 265,
            ),
            Text("RS47.60")
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
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
            SvgPicture.asset("assets/icons/googleplay.svg"),
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
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
            child: LargeButton(
          title: 'Next',
          sreenRatio: 0.9,
          onPressed: () {
            setState(() {});

            // authController.signIn();
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CardAdded_Screen(),
                ));
          },
          color: greenish,
          textcolor: Colors.white,
          buttonWidth: 0.95,
        )),
      ),
    ])));
  }
}
