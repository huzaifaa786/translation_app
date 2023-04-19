import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:translation/static/large_button.dart';
import 'package:translation/values/colors.dart';

class NotificationModal extends StatelessWidget {
  const NotificationModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: Wrap(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Center(
              child: Container(
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
            ),
            Center(
              child: const Text(
                "William Jones",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Center(
              child: const Text(
                "How do you rate your experience?",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                SizedBox(
                  width: 100,
                ),
                Icon(Icons.star, color: Colors.yellow, size: 40),
                Icon(Icons.star, color: Colors.yellow, size: 40),
                Icon(Icons.star, color: Colors.yellow, size: 40),
                Icon(Icons.star,
                    color: Color.fromARGB(255, 180, 180, 180), size: 40),
                Icon(Icons.star,
                    color: Color.fromARGB(255, 160, 160, 160), size: 40),
              ],
            ),
            const SizedBox(
              height: 65,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 28),
              child: Center(
                  child: LargeButton(
                title: 'Submit',
                sreenRatio: 0.8,
                onPressed: () {
                  // authController.signIn();
                  // Navigator.pushNamed(context, 'home');
                },
                color: greenish,
                textcolor: Colors.white,
                buttonWidth: 0.95,
              )),
            ),
          ]),
    );
  }
}
