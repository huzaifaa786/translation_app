import 'package:flutter/material.dart';

class Badgee extends StatelessWidget {
  const Badgee({
    Key? key,
    @required this.title,
    this.color,
    this.rounded = false,
    this.ontap,
  }) : super(key: key);
  final title;
  final color;
  final rounded;
  final ontap;
//  "assets/images/tick.svg",
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*0.22,
      padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
      decoration:
          BoxDecoration(color: color,borderRadius: BorderRadius.circular(25)),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
              color: Colors.white, fontSize: 12, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
