// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:translation/values/colors.dart';

class PPaymentMethod extends StatefulWidget {
  PPaymentMethod(
      {Key? key,
      this.value,
      this.groupvalue,
      this.onpress,
      this.onchaged,
      this.image,
      this.title})
      : super(
          key: key,
        );
  final value;
  final onpress;
  final groupvalue;
  final onchaged;
  final image;
  final title;
  @override
  State<PPaymentMethod> createState() => _PPaymentMethodState();
}

class _PPaymentMethodState extends State<PPaymentMethod> {
  @override
  Widget build(BuildContext context) {
    GetStorage box = GetStorage();
    return Directionality(
      textDirection:TextDirection.ltr,
      child: InkWell(
        onTap: widget.onchaged,
        child: Container(
          margin:  EdgeInsets.only(left: 34),
          padding: EdgeInsets.only(top: 7, bottom: 7),
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ListTile(
                  title: Transform.translate(
                    offset:  Offset(-25, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image(
                          image: AssetImage(widget.image),
                          height: 25,
                          width: 25,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          widget.title,
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                  trailing: Transform.scale(
                      scale: 1.2,
                      child: Radio(
                          value: widget.value.toString(),
                          groupValue: widget.groupvalue.toString(),
                          fillColor: MaterialStateColor.resolveWith(
                              (states) => greenish),
                          onChanged: (value) {
                            widget.onchaged();
                          })),
                  dense: true,
                  contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
