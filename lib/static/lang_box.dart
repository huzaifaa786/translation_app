import 'package:flutter/material.dart';
import 'package:translation/values/colors.dart';

class LanguageBox extends StatelessWidget {
  const LanguageBox({super.key, this.lang});
  final lang;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 12, bottom: 8),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.20,
        padding: EdgeInsets.only(bottom: 7, top: 7),
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
