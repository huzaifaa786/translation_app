import 'package:flutter/material.dart';
import 'package:translation/values/colors.dart';

class AddRemoveBtn extends StatelessWidget {
  const AddRemoveBtn({super.key,@required this.ontap,@required this.icon,this.color = white,this.iconcolor = Colors.black});
  final ontap;
  final icon;
  final color;
  final iconcolor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        child: Center(
            child: Text(
          icon,
          style: TextStyle(fontWeight: FontWeight.bold,color: iconcolor),
        )),
        width: 26,
        height: 26,
        decoration: BoxDecoration(
          color: color,
          border: Border.all(
            width: 1,
            color: Color.fromRGBO(0, 0, 0, 0.2),
          ),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
