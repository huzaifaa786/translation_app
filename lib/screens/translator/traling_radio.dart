import 'package:flutter/material.dart';
import 'package:translation/values/colors.dart';

class TralingRadioBtn extends StatelessWidget {
  const TralingRadioBtn({
    super.key,
    this.text,
    this.isSelected,
    this.ontap,
    this.image,
  });
  final text;
  final isSelected;
  final ontap;
  final image;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: InkWell(
        onTap: ontap,
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(top: 15, bottom: 15),
              height: 48,
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
              child: Row(
                children: [
                  // Image.asset(
                  //   image,
                  //   height: 26,
                  //   width: 26,
                  // ),
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(25))),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
