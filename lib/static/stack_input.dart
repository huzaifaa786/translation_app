import 'package:flutter/material.dart';

class StackInputField extends StatelessWidget {
  const StackInputField(
      {Key? key,
      this.controller,
      this.hint,
      this.text,
      this.color = Colors.white,
      this.obscure = false,
      this.maxlines = false,
      this.enabled = true,
      this.readOnly = false,
      this.onChange,
      this.lable,
      this.validator,
      this.autovalidateMode,
      // this.validate,
      this.icon,
      this.type = TextInputType.text,
      this.fontSize = 17.0,
      this.onpressed})
      : super(key: key);

  final controller;
  final validator;
  // final RxBool? validate;
  final obscure;
  final hint;
  final type;
  final lable;
  final icon;
  final text;
  final autovalidateMode;
  final color;
  final maxlines;
  final onChange;
  final onpressed;
  final fontSize;
  final enabled;
  final readOnly;

  @override
  Widget build(BuildContext context) {
    // bool isDark = Provider.of<DarkThemeProvider>(context).darkTheme;

    return Padding(
      padding: const EdgeInsets.only(top: 19,left: 20,right: 20),
      child: TextField(
        obscureText: obscure,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          fillColor: Colors.grey,
          border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
          hoverColor: Colors.grey,
          focusColor: Colors.grey,
          labelText: lable,
          hintText: hint,
        ),
      ),
    );
  }
}
