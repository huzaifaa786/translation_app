import 'package:flutter/material.dart';
import 'package:translation/values/colors.dart';

class RadioBtn extends StatefulWidget {
  const RadioBtn(
      {super.key, this.text, this.value, this.groupvalue, this.onChanged,this.image});
  final text;
  final value;
  final onChanged;
  final groupvalue;
  final image;

  @override
  State<RadioBtn> createState() => _RadioBtnState();
}

class _RadioBtnState extends State<RadioBtn> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Transform.translate(
        offset: Offset(-30, 0),
        child: Row(
          children: [
            Image.asset(widget.image,height: 26,width: 26,),
            Padding(
              padding: const EdgeInsets.only(left:8.0),
              child: Text(widget.text),
            ),
          ],
        ),
      ),
      leading: Transform.translate(
        offset: Offset(-25, 0),
        child: Radio(
          value: widget.value.toString(),
          groupValue: widget.groupvalue.toString(),
          fillColor: MaterialStateColor.resolveWith((states) => greenish),
          onChanged: (value) {
            widget.onChanged();
          },
        ),
      ),
    );
  }
}
