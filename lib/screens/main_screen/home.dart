import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:translation/static/topBar.dart';
import 'package:translation/values/colors.dart';
import 'package:translation/screens/home/chats.dart';
import 'package:translation/static/main_card.dart';
import 'package:translation/screens/home/orderhistory.dart';
import 'package:translation/screens/home/setting.dart';
import 'package:translation/screens/translator_screens/translator_screen.dart';
import 'package:translation/static/input_field.dart';
import 'package:translation/static/dropdown.dart';

import '../../../static/large_button.dart';

class Home_screen extends StatefulWidget {
  const Home_screen({super.key});

  @override
  State<Home_screen> createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen> {
  @override
  Widget build(BuildContext context) {
    PersistentTabController _controller;
    _controller = PersistentTabController(initialIndex: 0);

    return PersistentTabView(
      context,
      // controller: _controller,
      screens: _buildScreens(),
      items: _navBarItem(),

      navBarStyle: NavBarStyle.style16,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(1.0),
        colorBehindNavBar: Colors.white,
      ),
    );
  }
}

List<PersistentBottomNavBarItem> _navBarItem() {
  return [
    PersistentBottomNavBarItem(
      icon: Icon(Icons.home),
      title: ('Home'),
      activeColorSecondary: greenish,
      inactiveColorPrimary: kblack,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(Icons.chat),
      title: ('Chat'),
      activeColorSecondary: greenish,
      inactiveColorPrimary: kblack,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(Icons.video_call_sharp),
      activeColorPrimary: greenish,
      activeColorSecondary: white,
      inactiveColorPrimary: kblack,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(Icons.list_alt),
      title: ('Orders'),
      activeColorSecondary: greenish,
      inactiveColorPrimary: kblack,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(Icons.settings),
      title: ('Settings'),
      activeColorSecondary: greenish,
      inactiveColorPrimary: kblack,
    ),
  ];
}

@override
List<Widget> _buildScreens() {
  return [
    Home(),
    Chats_screen(),
    Text("Video"),
    OrdrerHistory_screen(),
    Setting_screen(),
  ];
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
    'Item5',
    'Item6',
    'Item7',
    'Item8',
  ];
  String? selectedValue;
  String? selectedValue1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            MainStackCard(),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20, top: 35),
              height: MediaQuery.of(context).size.height * 0.60,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Choose Language',
                          style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                              color: greenish),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text(
                        'From:',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: kblack),
                      ),
                    ),
                    DropdownField(
                      text: 'Select Language',
                      selectedvalue: selectedValue,
                      items: items.toList(),
                      icon:
                          ImageIcon(AssetImage('assets/images/drop_arrow.png')),
                      onChange: (value) {
                        setState(() {
                          selectedValue = value;
                        });
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Text(
                        'To:',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: kblack),
                      ),
                    ),
                    DropdownField(
                      text: 'Select Language',
                      selectedvalue: selectedValue,
                      items: items.toList(),
                      icon:
                          ImageIcon(AssetImage('assets/images/drop_arrow.png')),
                      onChange: (value) {
                        setState(() {
                          selectedValue1 = value;
                        });
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 35, bottom: 20),
                      child: LargeButton(
                        title: 'Translate',
                        sreenRatio: 0.9,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Translator_(),
                              ));
                        },
                        color: greenish,
                        textcolor: Colors.white,
                        buttonWidth: 0.95,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
