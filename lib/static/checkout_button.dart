// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:translation/models/service.dart';

import '../values/colors.dart';

class CheckOutButton extends StatelessWidget {
  const CheckOutButton(
      {Key? key,
      @required this.title,
      @required this.price,
      @required this.onPressed,
      this.text,
      this.textcolor,
      this.icon,
      this.currencyname,
      this.buttonWidth = 0.8,
      this.sreenRatio = 0.9,
      this.color = secondaryColor})
      : super(key: key);

  final title;
  final price;
  final onPressed;
  final sreenRatio;
  final color;
  final text;
  final textcolor;
  final icon;
  final buttonWidth;
  final currencyname;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * sreenRatio,
      height: 60,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shadowColor: primaryColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            FutureBuilder<String>(
              future: changePrice(price),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error');
                } else {
                  return Text(
                    '${snapshot.data} $currencyname',
                    style: TextStyle(
                      color: white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins',
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
