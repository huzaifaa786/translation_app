import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:translation/values/colors.dart';
import 'package:translation/screens/main_screen/home.dart';
import 'package:translation/static/large_button.dart';

class Notification_screen extends StatefulWidget {
  const Notification_screen({super.key});

  @override
  State<Notification_screen> createState() => _Notification_screenState();
}

class _Notification_screenState extends State<Notification_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Home()));
                    },
                    child: SvgPicture.asset("assets/icons/back.svg")),
                SizedBox(
                  width: 100,
                ),
                Text(
                  "Notification",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) => Container(
                      height: 86,
                      width: 326,
                      child: Card(
                        color: Color.fromARGB(255, 255, 255, 255),
                        child: ListTile(
                          onTap: () {},
                          trailing: GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) =>
                              //           attendant_report_screen()),
                              // );
                            },
                            child: Container(
                              width: 80,
                              height: 40.0,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                              ),
                              child: Center(
                                child: ElevatedButton(
                                  onPressed: () {
                                    // Add your button's onPressed function here
                                    showModalBottomSheet(
                                      context: context,
                                      isScrollControlled: true,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(40),
                                        ),
                                      ),
                                      builder: (context) => Wrap(
                                          // ignore: prefer_const_literals_to_create_immutables
                                          children: [
                                            Center(
                                              child: Container(
                                                margin: EdgeInsets.all(8),
                                                width: 98,
                                                height: 98,
                                                padding: EdgeInsets.all(8),
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      width: 2,
                                                      color: Color(0xFF34607B)),
                                                  borderRadius:
                                                      BorderRadius.circular(70),
                                                ),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(22),
                                                  child: SvgPicture.asset(
                                                    "assets/images/splash_3.svg",
                                                    width: 64,
                                                    height: 64,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Center(
                                              child: const Text(
                                                "William Jones",
                                                style: TextStyle(
                                                    fontSize: 22,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 40,
                                            ),
                                            Center(
                                              child: const Text(
                                                "How do you rate your experience?",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 40,
                                            ),
                                            Row(
                                              children: [
                                                SizedBox(
                                                  width: 100,
                                                ),
                                                Icon(Icons.star,
                                                    color: Colors.yellow,
                                                    size: 40),
                                                Icon(Icons.star,
                                                    color: Colors.yellow,
                                                    size: 40),
                                                Icon(Icons.star,
                                                    color: Colors.yellow,
                                                    size: 40),
                                                Icon(Icons.star,
                                                    color: Color.fromARGB(
                                                        255, 180, 180, 180),
                                                    size: 40),
                                                Icon(Icons.star,
                                                    color: Color.fromARGB(
                                                        255, 160, 160, 160),
                                                    size: 40),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 65,
                                            ),
                                            Center(
                                                child: LargeButton(
                                              title: 'Submit',
                                              sreenRatio: 0.8,
                                              onPressed: () {
                                                setState(() {});
                                                // authController.signIn();
                                                // Navigator.pushNamed(context, 'home');
                                              },
                                              color: greenish,
                                              textcolor: Colors.white,
                                              buttonWidth: 0.95,
                                            )),
                                          ]),
                                    );
                                  },
                                  child: Text(
                                    'Accepted',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: Size(78, 26),
                                    padding: EdgeInsets.zero,
                                    primary:
                                        Colors.blue, // Button background color
                                    onPrimary:
                                        Colors.white, // Button text color
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          8.0), // Button border radius
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          title: Text(
                            'Arlene McCoy',
                            style: TextStyle(
                                color: Color.fromARGB(255, 8, 8, 8),
                                fontSize: 14),
                          ),
                          subtitle: Text(
                            'Your order has been accepted',
                            style: TextStyle(
                                color: Color.fromARGB(255, 8, 8, 8),
                                fontSize: 10),
                          ),
                          leading: Container(
                            child: CircleAvatar(
                              radius: 20,
                              backgroundImage:
                                  AssetImage('assets/images/loginback.png'),
                            ),
                          ),
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
    );
  }
}
