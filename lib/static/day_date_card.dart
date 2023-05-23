import 'package:flutter/material.dart';
import 'package:translation/values/colors.dart';

class DateDayCard extends StatelessWidget {
  const DateDayCard({super.key, this.day, this.date,this.color = white});
  final day;
  final date;
  final color;

  @override
  Widget build(BuildContext context) {
    return Container(
    
      padding: EdgeInsets.only(top: 8, bottom: 8),
      margin: EdgeInsets.only(left: 4, right: 4,top: 8,bottom: 8),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Text(
          day,
          style: TextStyle(fontSize: 14),
        ),
        Text(date.toString(), style: TextStyle(fontSize: 16))
      ]),
      width: MediaQuery.of(context).size.width * 0.22,
      height: MediaQuery.of(context).size.height * 0.09,
     
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: hintText.withOpacity(0.4)),
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
