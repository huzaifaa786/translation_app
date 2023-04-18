import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:translation/screens/home/translator/profile_translator.dart';

class OnlineTranslatorCard extends StatelessWidget {
  const OnlineTranslatorCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => profile_translator()));
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13),
        ),
        color: Color.fromARGB(255, 255, 255, 255),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(8),
                width: MediaQuery.of(context).size.width * 0.22,
                height: MediaQuery.of(context).size.height * 0.1,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Color(0xFF34607B)),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(22),
                  child: SvgPicture.asset(
                    "assets/images/splash_3.svg",
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: MediaQuery.of(context).size.height * 0.1,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                "Watson",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FittedBox(
                      fit: BoxFit.scaleDown,
                      child: SvgPicture.asset('assets/images/star.svg',
                          height: 11, width: 11)),
                  Padding(
                    padding: const EdgeInsets.only(top: 4, left: 4),
                    child: Text('5.0',
                        style: TextStyle(
                            fontSize: 11, fontWeight: FontWeight.w400)),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 4,left: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Rate per 30 mins:  ",
                      style: TextStyle(fontSize: 9, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "100 AED",
                      style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
