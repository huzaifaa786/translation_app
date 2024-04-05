import 'package:flutter/material.dart';

import 'package:translation/values/colors.dart';

class Box extends StatelessWidget {
  const Box({
    Key? key,
    @required this.title,
    this.ontap,
    this.selected,
  });
  final title;
  final ontap;
  final selected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: InkWell(
        onTap: ontap,
        child: Container(
          height: 37,
          width: MediaQuery.of(context).size.width * 0.25,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(45),
            color:
                // selected == false ? Colors.white :
                greenish,
            // border:
            //     Border.all(color: selected == false ? Colors.grey : greenish),
          ),
          child: Center(
              child: Text(
            title,
            style: TextStyle(
                color:
                    // selected == false ? Colors.black :
                    white,
                fontSize: 15,
                fontWeight: FontWeight.w500),
          )),
        ),
      ),
    );
  }
}
