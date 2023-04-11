import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:translation/screens/home/chatdetails.dart';

class Chats_screen extends StatefulWidget {
  const Chats_screen({super.key});

  @override
  State<Chats_screen> createState() => _Chats_screenState();
}

class _Chats_screenState extends State<Chats_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 141,
            decoration: BoxDecoration(
              color: Color(0xFF34607B),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(38, 68, 0, 0),
              child: Text(
                "Chats",
                style: TextStyle(
                  fontFamily: 'Mazzard',
                  fontWeight: FontWeight.w600,
                  fontSize: 25,
                  height: 1.5,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(31, 20, 28, 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Color.fromRGBO(0, 0, 0, 0.49),
                width: 1,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: "Search ",
                      border: InputBorder.none,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                    style: TextStyle(
                      fontFamily: 'Sk-Modernist',
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      height: 1.5,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 38.0),
            child: Row(
              children: [
                Text(
                  "Messages",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 6,
              itemBuilder: (context, index) {
                return Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Chatdetails_screen()));
                        },
                        child: Row(
                          children: <Widget>[
                            // ClipRRect(

                            // borderRadius: BorderRadius.circular(40.0),
                            // child: Image.network('http://10.0.2.2:8000/api/image',
                            // height: 100,
                            //   width:100,
                            //    fit: BoxFit.cover,
                            //       )),
                            Container(
                              width: 70,
                              height: 70,
                              margin: EdgeInsets.only(left: 15),
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 2, color: Color(0xFF34607B)),
                                borderRadius: BorderRadius.circular(70),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(22),
                                child: SvgPicture.asset(
                                  "assets/images/splash_3.svg",
                                  width: 64,
                                  height: 64,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          'Cody Fisher',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14.0),
                                        ),
                                        Text(
                                          '23 min',
                                          style: TextStyle(
                                            color: Colors.black45,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 9.0),
                                      child: Text(
                                        'Ok, see you then.',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black45,
                                            fontSize: 14.0),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Divider(),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
