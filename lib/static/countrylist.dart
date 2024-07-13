import 'package:flutter/material.dart';
import 'package:translation/values/colors.dart';

class CountryList extends StatelessWidget {
  const CountryList({
    Key? key,
    this.value,
    this.groupvalue,
    this.onchaged,
    required this.picture,
    required this.countrycurrency,
  }) : super(key: key);

  final dynamic value;
  final dynamic groupvalue;
  final ValueChanged<dynamic>? onchaged;
  final String picture;
  final String countrycurrency;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RadioListTile(
        title: Row(
          children: [
            Image.asset(picture),
            SizedBox(width: 10),
            Text(
              countrycurrency,
              style: TextStyle(
                  color: greenish,
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
        activeColor: greenish,
        value: value,
        groupValue: groupvalue,
        onChanged: onchaged,
      ),
    );
  }
}
