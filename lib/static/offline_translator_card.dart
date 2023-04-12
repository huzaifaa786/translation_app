import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OfflineTranslattorCard extends StatelessWidget {
  const OfflineTranslattorCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        color: Color.fromARGB(255, 255, 255, 255),
        child: Container(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Color(0xFF34607B)),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(22),
                      child: Image.asset(
                        "assets/images/placeholder.png",
                        width: 64,
                        height: 64,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Theresea Webb",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            Text(
                              "Rate per 30 mins:  ",
                              style: TextStyle(
                                  fontSize: 9, fontWeight: FontWeight.w700),
                            ),
                            Text(
                              "100 AED",
                              style: TextStyle(
                                  fontSize: 11, fontWeight: FontWeight.w700),
                            )
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            FittedBox(
                                fit: BoxFit.scaleDown,
                                child: SvgPicture.asset(
                                    'assets/images/star.svg',
                                    height: 11,
                                    width: 11)),
                            Padding(
                              padding: const EdgeInsets.only(top: 4, left: 2),
                              child: Text('5.0',
                                  style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w400)),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 4),
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    color: Color.fromRGBO(0, 0, 0, 0.24),
                                    width: 1),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                'Arabic',
                                textDirection: TextDirection.rtl,
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 4),
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    color: Color.fromRGBO(0, 0, 0, 0.24),
                                    width: 1),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                'Turkish',
                                textDirection: TextDirection.rtl,
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 4),
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    color: Color.fromRGBO(0, 0, 0, 0.24),
                                    width: 1),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                'English',
                                textDirection: TextDirection.rtl,
                                style: TextStyle(fontSize: 12),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SvgPicture.asset("assets/icons/forward.svg"),
            ],
          ),
        ),
        elevation: 5,
        shadowColor: Colors.black54,
        margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
