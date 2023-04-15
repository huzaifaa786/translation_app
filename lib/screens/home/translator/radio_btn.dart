import 'package:flutter/material.dart';
import 'package:translation/values/colors.dart';

class RadioBtn extends StatefulWidget {
  const RadioBtn(
      {super.key, this.text, this.value, this.groupvalue, this.onChanged});
  final text;
  final value;
  final onChanged;
  final groupvalue;

  @override
  State<RadioBtn> createState() => _RadioBtnState();
}

class _RadioBtnState extends State<RadioBtn> {
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
