// ignore_for_file: prefer_typing_uninitialized_variables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:translation/values/colors.dart';

class InputFieldPassword1 extends StatelessWidget {
  InputFieldPassword1(
      {Key? key,
      this.controller,
      this.borderColor = greenish,
      this.imageColor = greenish,
      this.hint,
      this.text,
      this.icon,
      this.imageIcon,
      this.obscure = false,
      this.toggle,
      this.onChange,
      this.validator,
      this.validate,
      this.autovalidateMode,
      this.type = TextInputType.text,
      this.onpressed})
      : super(key: key);

  final controller;
  final validator;
  final RxBool? validate;
  final autovalidateMode;
  final obscure;
  final hint;
  final type;
  final text;
  final icon;
  final imageIcon;
  final toggle;
  final onChange;
  final onpressed;
  final borderColor;
  final imageColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      // decoration: BoxDecoration(
      //   border: Border.all(color: Colors.grey),
      //   borderRadius: BorderRadius.all(
      //     Radius.circular(6),
      //   ),
      // ),
      child: Card(
        color: Color.fromRGBO(255, 255, 255, 1),
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.grey[400]!,
            )),
        child: TextFormField(
          style: const TextStyle(fontSize: 14),
          controller: controller,
          decoration: InputDecoration(
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: greenish,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: SvgPicture.asset(
                      imageIcon,
                      height: 17,
                      width: 17,
                      color: greenish,
                    ),
                  ),
                ),
              ),
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
              filled: true,
              fillColor: Colors.white,
              hintText: hint,
              hintStyle: TextStyle(color: textGrey),
              contentPadding: const EdgeInsets.only(left: 3.0),
              border: OutlineInputBorder(borderSide: BorderSide.none)),
          keyboardType: type,
          cursorColor: Colors.black,
          obscureText: obscure,
          maxLines: 1,
          validator: validator,
          autovalidateMode: autovalidateMode ??
              (validate == true.obs
                  ? AutovalidateMode.always
                  : AutovalidateMode.onUserInteraction),
        ),
      ),
    );
  }
}
