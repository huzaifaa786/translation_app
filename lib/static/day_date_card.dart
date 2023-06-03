import 'package:flutter/material.dart';
import 'package:translation/values/colors.dart';

class DateDayCard extends StatelessWidget {
  const DateDayCard(
      {super.key,
      this.day,
      this.date,
      this.color = white,
      this.onTap,
      this.isSelected = false});
  final day;
  final date;
  final color;
  final bool isSelected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    var finalColor = isSelected ? greenish : color;
    var finalTextColor = isSelected ? white : Colors.black;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(top: 8, bottom: 8),
        margin: EdgeInsets.only(left: 4, right: 4, top: 8, bottom: 8),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Text(
            day,
            style: TextStyle(fontSize: 14,color: finalTextColor),
          ),
          Text(date.toString(), style: TextStyle(fontSize: 16 , color: finalTextColor))
        ]),
        width: MediaQuery.of(context).size.width * 0.22,
        height: MediaQuery.of(context).size.height * 0.09,
        decoration: BoxDecoration(
          color: finalColor,
          border: Border.all(color: hintText.withOpacity(0.4)),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
