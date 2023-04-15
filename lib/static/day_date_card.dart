import 'package:flutter/material.dart';
import 'package:translation/values/colors.dart';

class DateDayCard extends StatelessWidget {
  const DateDayCard({super.key, this.day, this.date});
  final day;
  final date;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 8, bottom: 8),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Text(
          day,
          style: TextStyle(fontSize: 14),
        ),
        Text(date.toString(), style: TextStyle(fontSize: 16))
      ]),
      width: MediaQuery.of(context).size.width * 0.12,
      height: MediaQuery.of(context).size.height * 0.09,
      margin: EdgeInsets.only(top: 16, bottom: 16),
      decoration: BoxDecoration(
        // color: Color(0xFFF2F2F2),
        border: Border.all(color: gray),
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
