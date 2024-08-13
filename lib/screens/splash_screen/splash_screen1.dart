// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:translation/static/button.dart';
import 'package:translation/values/colors.dart';
import 'package:translation/models/introslidemodel.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int currentIndex = 0;
  late PageController _pageController;
  List<OnboardModel> screens = <OnboardModel>[
    OnboardModel(
      img: ("assets/images/splash_1.png"),
      text: "Best solution for your Language barriers.",
      desc: "الحل الأمثل للعائق اللغوي",
    ),
    OnboardModel(
      img: 'assets/images/splash_2.png',
      text: "Audio / video interpretation service",
      desc: "خدمات الترجمة بالصوت / الفيديو",
    ),
    OnboardModel(
      img: 'assets/images/splash_3.png',
      text: "Booking in person interpretation services",
      desc: "خدمات حجز المترجمين وجه لوجه",
    ),
    OnboardModel(
      img: 'assets/images/splash_4.png',
      text: "Document translation services",
      desc: "خدمة ترجمة المستندات",
    ),
  ];

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:   Padding(
        padding: const EdgeInsets.symmetric(horizontal: 1.0),
        child: PageView.builder(
            itemCount: screens.length,
            controller: _pageController,
            // physics: NeverScrollableScrollPhysics(),
            onPageChanged: (int index) {
              setState(() {
                currentIndex = index;
              });
            },
            itemBuilder: (_, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image(
                    image: AssetImage(screens[index].img),
                    height: MediaQuery.of(context).size.height * 0.55,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 40),
                    child: SizedBox(
                      height: 10.0,
                      child: ListView.builder(
                        itemCount: screens.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 3.0),
                                  width: currentIndex == index ? 25 : 8,
                                  height: 7,
                                  decoration: BoxDecoration(
                                    color: currentIndex == index
                                        ? greenish
                                        : kgrey,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ]);
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                          color: greenish,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              topLeft: Radius.circular(30))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 40, bottom: 20),
                                  child: Text(
                                    screens[index].text,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: kwhite,
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    screens[index].desc,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: kwhite,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 30),
                            child: Button(
                                title: "NEXT",
                                onPressed: () {
                                  if (index == screens.length - 1) {
                                    Navigator.pushNamed(context, 'login');
                                  } else {
                                    currentIndex++;
                                    _pageController.animateToPage(
                                      currentIndex,
                                      duration:
                                          const Duration(milliseconds: 400),
                                      curve: Curves.ease,
                                    );
                                  }
                                },
                                color: white,
                                textcolor: greenish),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              );
            }),
      ),
    );
  }
}
