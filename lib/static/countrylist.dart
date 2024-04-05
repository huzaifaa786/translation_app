import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:translation/values/colors.dart';

class CountryList extends StatefulWidget {
  CountryList({
    Key? key,
    this.value,
    this.groupvalue,
    this.onchaged,
    required this.picture,
    this.countrycurrency,
  }) : super(
          key: key,
        );
  final value;
  final groupvalue;
  final onchaged;
  final String picture;
  final countrycurrency;

  @override
  State<CountryList> createState() => _CountryListState();
}

class _CountryListState extends State<CountryList> {
  final List<Map<String, dynamic>> currency = [
    {'title': 'GBP - British Pound', 'image ': ''},
    {'title': 'USD - American Dollar', 'image ': ''},
    {'title': 'CAD- Canadian Dollar', 'image ': ''},
    {'title': 'EUR -  Euro', 'image ': ''},
    {'title': 'AED -  Emirati Dirham', 'image ': ''},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        child: RadioListTile(
            title: Row(
              children: [
                Image.asset(widget.picture),
                Text(
                  widget.countrycurrency,
                  style: TextStyle(
                      color: greenish,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
            value: widget.value.toString(),
            groupValue: widget.groupvalue.toString(),
            onChanged: (value) {
              widget.onchaged();
            }));
  }
}
