import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:translation/screens/main_screen/home.dart';
import 'package:translation/static/titletopbar.dart';

class Favorites_screen extends StatefulWidget {
  const Favorites_screen({super.key});

  @override
  State<Favorites_screen> createState() => _Favorites_screenState();
}

class _Favorites_screenState extends State<Favorites_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
         
           TitleTopbar(
              text: 'Favorites',
               ontap: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (context, index) => Container(
                        height: 117,
                        width: 361,
                        padding: EdgeInsets.all(5),
                        child: Card(
                          color: Color.fromARGB(255, 255, 255, 255),
                          // ignore: sort_child_properties_last
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                width: 68,
                                height: 68,
                                padding: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2, color: Color(0xFF34607B)),
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(22),
                                  child: SvgPicture.asset(
                                    "assets/images/splash_1.svg",
                                    width: 64,
                                    height: 64,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 8, 55, 0),
                                    child: const Text(
                                      "Theresea Webb",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 4, 28, 0),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Rate per 30 mins:  ",
                                          style: TextStyle(
                                              fontSize: 9,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "100 AED",
                                          style: TextStyle(
                                              fontSize: 11,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 110.0),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(Icons.star,
                                            color: Colors.yellow, size: 11),
                                        SizedBox(width: 5),
                                        Text('5.0',
                                            style: TextStyle(
                                                fontSize: 11,
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(4),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                                color:
                                                    Color.fromRGBO(0, 0, 0, 0.24),
                                                width: 1),
                                            borderRadius:
                                                BorderRadius.circular(6),
                                          ),
                                          child: Text(
                                            'Arabic',
                                            textDirection: TextDirection.rtl,
                                            style: TextStyle(fontSize: 12),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(4),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                                color:
                                                    Color.fromRGBO(0, 0, 0, 0.24),
                                                width: 1),
                                            borderRadius:
                                                BorderRadius.circular(6),
                                          ),
                                          child: Text(
                                            'Turkish',
                                            textDirection: TextDirection.rtl,
                                            style: TextStyle(fontSize: 12),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(4),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                                color:
                                                    Color.fromRGBO(0, 0, 0, 0.24),
                                                width: 1),
                                            borderRadius:
                                                BorderRadius.circular(6),
                                          ),
                                          child: Text(
                                            'English',
                                            textDirection: TextDirection.rtl,
                                            style: TextStyle(fontSize: 12),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 30.0),
                                    child: Icon(Icons.heart_broken),
                                  )
                                ],
                              )
                            ],
                          ),
                          elevation: 7,
                          shadowColor: Color.fromARGB(255, 63, 63, 63),
                          margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                      )),
            ),
          ],
        ),
      ),
    );
  }
}
