import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PasswordInputField extends StatelessWidget {
  const PasswordInputField(
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
      this.toggle,
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
  final toggle;
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

    return SizedBox(
      width: Get.width * 0.9,
      child: Padding(
        padding: const EdgeInsets.only(top: 19, left: 20, right: 20),
        child: TextFormField(
          readOnly: readOnly,
          controller: controller,
          obscureText: obscure,
          validator: validator,
          autovalidateMode: autovalidateMode ??
              (validator == true.obs
                  ? AutovalidateMode.always
                  : AutovalidateMode.onUserInteraction),
          decoration: InputDecoration(
            suffixIcon: GestureDetector(
              onTap: () {
                toggle();
              },
              child: Icon(
                obscure
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                color: Colors.black,
              ),
            ),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            fillColor: Colors.white,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12))),
            hoverColor: Colors.grey,
            focusColor: Colors.grey,
            labelText: lable,
            hintText: hint,
          ),
        ),
      ),
    );
  }
}
