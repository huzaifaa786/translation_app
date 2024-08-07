import 'package:flutter/material.dart';

class Badgee extends StatelessWidget {
  const Badgee({
    Key? key,
    @required this.title,
    this.color,
    this.rounded = false,
    this.ontap,
    this.picture,
  }) : super(key: key);
  final title;
  final color;
  final rounded;
  final ontap;
  final picture;
//  "assets/images/tick.svg",
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
      child: Row(
        children: [
          Image.asset(
            "assets/images/Progress Indicator.png",
            color: color,
          ),
          Text(
            title,
            style: TextStyle(
                color: color, fontSize: 12, fontWeight: FontWeight.w400),
          ),
          Image.asset(
            picture,
            color: color,
          ),
        ],
      ),
    );
  }
}
