import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:translation/values/colors.dart';

class Scheduleinput extends StatelessWidget {
  const Scheduleinput(
      {Key? key,
      this.controller,
      this.hint,
      this.text,
      this.maxlines = false,
      this.enabled = true,
      this.readOnly = false,
      this.obscure = false,
      this.showSuffix = false,
      this.validator,
      this.autovalidateMode,
      this.validate,
      this.suffix,
      this.type = TextInputType.text,
      this.fontSize = 14.0,
      this.width = 0.98,
      this.onpressed})
      : super(key: key);

  final controller;
  final validator;
  final bool? validate;
  final hint;
  final width;
  final type;
  final showSuffix;
  final suffix;
  final obscure;
  final text;
  final autovalidateMode;
  final maxlines;
  final onpressed;
  final fontSize;
  final enabled;
  final readOnly;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 4,left: 6,right: 6),
            child: Row(
              children: [
                Image.asset('assets/images/sandWatch.png',height: 12,),
                Gap(2),
                Text(
                  text,
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40,
            width: MediaQuery.of(context).size.width * 0.32,
            child: TextFormField(
              readOnly: true,
              onTap: onpressed,
              enabled: enabled,
              obscureText: obscure,
              controller: controller,
              style: TextStyle(fontSize: fontSize, color: white),
              keyboardType: type,
              validator: validator,
              decoration: InputDecoration(
                filled: true,
                fillColor: greenish,
                hintText: hint,
                contentPadding: const EdgeInsets.only(left: 16, right: 16),
                hintStyle: TextStyle(color: primaryLightcolor),
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.grey[500]!),
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                ),
              ),
              cursorColor: Colors.white,
              maxLines: maxlines == true ? null : 1,
            ),
          ),
        ],
      ),
    );
  }
}
