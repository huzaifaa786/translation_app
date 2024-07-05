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
      this.isSelected = false,
      this.title})
      : super(
          key: key,
        );
  final value;
  final bool isSelected;
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
      textDirection: TextDirection.ltr,
      child: InkWell(
        onTap: () {
          if (widget.onchaged != null) {
            widget.onchaged();
          }
        },
        child: Container(
          padding: EdgeInsets.only(top: 7, bottom: 7),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            border: Border.all(color: greenish, width: 1),
            borderRadius: BorderRadius.circular(15),
          color: widget.isSelected ? greenish : Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage(widget.image),
                        height: 25,
                        width: 25,
                        color: widget.isSelected ? white : greenish,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        widget.title,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                          color: widget.isSelected ? white : greenish,
                        ),
                      ),
                    ],
                  ),
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
