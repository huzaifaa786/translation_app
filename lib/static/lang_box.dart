import 'package:flutter/material.dart';

class LanguageBox extends StatelessWidget {
  const LanguageBox({super.key, this.lang});
  final lang;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 12,bottom: 8),
      child: Container(
        width: MediaQuery.of(context).size.width*0.22,
        padding: EdgeInsets.only(bottom: 10,top: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Color.fromRGBO(0, 0, 0, 0.24), width: 1),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            lang,
            style: TextStyle(fontSize: 12),
          ),
        ),
      ),
    );
  }
}
