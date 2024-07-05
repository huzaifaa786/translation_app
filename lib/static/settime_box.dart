import 'package:flutter/material.dart';
import 'package:translation/values/colors.dart';

class SetTime extends StatelessWidget {
  const SetTime({super.key, this.lang});
  final lang;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.9,
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
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.watch_later_rounded),
                Text(
                  'Set Time',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                ),
              ],
            ),
        
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Image.asset('assets/icons/Sand Watch.png'),
                        Text(
                          'Start Time',
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.w600),
                        )
                      ],
                    )
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Image.asset('assets/icons/Sand Watch.png'),
                        Text(
                          'Start Time',
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.w600),
                        )
                      ],
                    )
                  ],
                )
              ],
            )
          ],
        ));
  }
}
