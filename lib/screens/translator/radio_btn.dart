import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:translation/values/colors.dart';

class RadioBtn extends StatefulWidget {
  const RadioBtn(
      {super.key,
      this.text,
      this.value,
      this.groupvalue,
      this.onChanged,
      this.image});
  final text;
  final value;
  final onChanged;
  final groupvalue;
  final image;

  @override
  State<RadioBtn> createState() => _RadioBtnState();
}

class _RadioBtnState extends State<RadioBtn> {
  GetStorage box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey[500]!,
            blurRadius: 5,
            offset: Offset(0.00001, 1),
          ),
        ],
        color: Colors.white,
        border: Border.all(color: greenish, width: 1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        title: Transform.translate(
          offset: box.read('locale') != 'ar' ? Offset(-30, 0) : Offset(30, 0),
          child: Row(
            children: [
              Image.asset(
                widget.image,
                height: 26,
                width: 26,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8),
                child: Text(widget.text),
              ),
            ],
          ),
        ),
        leading: Transform.translate(
          offset: box.read('locale') != 'ar' ? Offset(-25, 0) : Offset(25, 0),
          child: Radio(
            value: widget.value.toString(),
            groupValue: widget.groupvalue.toString(),
            fillColor: MaterialStateColor.resolveWith((states) => greenish),
            onChanged: (value) {
              widget.onChanged();
            },
          ),
        ),
      ),
    );
  }
}
