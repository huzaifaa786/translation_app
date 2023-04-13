import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:translation/values/colors.dart';

class BugReportModal extends StatelessWidget {
  const BugReportModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 313,
      height: 275,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            width: 43,
            height: 43,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 199, 193, 193),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: SvgPicture.asset(
                "assets/icons/warning.svg", // replace with your logo asset path
                height: 20,
                width: 20,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Text(
              'Sorry! Interpreter not within your range.',
              style: TextStyle(fontSize: 11),
              textAlign: TextAlign.center,
            ),
          ),
          Row(
            children: [
              Container(
                width: 270,
                height: 100,
                margin: EdgeInsets.only(
                  left: 20,
                  top: 8,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Color.fromRGBO(0, 0, 0, 0.17),
                  ),
                  borderRadius: BorderRadius.circular(9),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(""),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Send'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(greenish),
                  fixedSize: MaterialStateProperty.all(Size(248, 64)),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
