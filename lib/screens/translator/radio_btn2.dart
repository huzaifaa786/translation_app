import 'package:flutter/material.dart';
import 'package:translation/values/colors.dart';

class RadioBtn2 extends StatefulWidget {
  const RadioBtn2(
      {super.key, this.text, this.value, this.groupvalue, this.onChanged,this.image});
  final text;
  final value;
  final onChanged;
  final groupvalue;
  final image;

  @override
  State<RadioBtn2> createState() => _RadioBtn2State();
}

class _RadioBtn2State extends State<RadioBtn2> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Transform.translate(
        offset: Offset(-25, 0),
        child: Text(widget.text),
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
