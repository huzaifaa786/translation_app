import 'package:flutter/material.dart';
import 'package:translation/values/colors.dart';

class TralingRadioBtn extends StatelessWidget {
  const TralingRadioBtn(
      {super.key, this.text, this.isSelected , this.ontap});
  final text;
  final isSelected;
  final ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(top: 15, bottom: 15),
            height: 48,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: greenish, width: 1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 24),
                  child: Text(
                    text,
                    style: TextStyle(fontSize: 16, color: greenish),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 2, color: greenish),
                        borderRadius: BorderRadius.all(Radius.circular(25))),
                    child: Container(
                      height: 12,
                      width: 12,
                      margin: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          color: isSelected == true ? greenish : white,
                          borderRadius: BorderRadius.all(Radius.circular(25))),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
