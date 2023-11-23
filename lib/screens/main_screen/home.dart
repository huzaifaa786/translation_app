// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:translation/screens/chat/chatcontroller.dart';
import 'package:translation/screens/main_screen/homecontroller.dart';
import 'package:translation/screens/notification/notification_card.dart';
import 'package:translation/values/colors.dart';
import 'package:translation/screens/chat/chats.dart';
import 'package:translation/static/main_card.dart';
import 'package:translation/screens/orderhistory/orderhistory.dart';
import 'package:translation/screens/setting/setting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:translation/static/dropdown.dart';
import 'package:translation/values/controllers.dart';
import 'package:translation/values/language.dart';
import 'package:badges/badges.dart' as badges;
import '../../../static/large_button.dart';

class Home_screen extends StatefulWidget {
  const Home_screen({super.key});

  @override
  State<Home_screen> createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen> {
  PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  readrating() async {
    var order = await homeController.getratting();
    if (order != null) {
      if (order.has_rating == false) {
        showModalBottomSheet(
          context: context,
          builder: (context) => NotificationModal(order: order),
        );
      }
    }
  }

  @override
  void initState() {
    readrating();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatController>(
      builder: (controller) => PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarItem(),
        navBarStyle: NavBarStyle.style6,
        decoration: NavBarDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.grey,
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3))
          ],
          borderRadius: BorderRadius.circular(1.0),
          colorBehindNavBar: Colors.white,
        ),
      ),
    );
  }

  List<PersistentBottomNavBarItem> _navBarItem() {
    return [
      PersistentBottomNavBarItem(
        // onPressed: (BuildContext? context) async {
        //   homeController.clear();
        //   await homeController.getuser();
        //   setState(() {
        //     _controller.index = 0;
        //   });
        // },
        icon: FaIcon(FontAwesomeIcons.house),
        title: ('Home'.tr),
        textStyle: TextStyle(
            fontFamily: 'Poppins', fontSize: 10, fontWeight: FontWeight.w400),
        iconSize: 20,
        activeColorSecondary: greenish,
        inactiveColorPrimary: kblack,
      ),
      PersistentBottomNavBarItem(
        icon: chatController.unseen != null
            ? badges.Badge(
                showBadge: chatController.unseen == '0' ? false : true,
                badgeContent: Text(chatController.unseen!),
                child: FaIcon(FontAwesomeIcons.commentDots),
              )
            : FaIcon(FontAwesomeIcons.commentDots),
        iconSize: 20,
        title: ('Chat'.tr),
        textStyle: TextStyle(
            fontFamily: 'Poppins', fontSize: 10, fontWeight: FontWeight.w400),
        activeColorSecondary: greenish,
        inactiveColorPrimary: kblack,
        onPressed: (BuildContext? context) async {
          await chatController.getContacts();
          setState(() {
            _controller.index = 1;
          });
        },
      ),
      // PersistentBottomNavBarItem(
      //   icon: Icon(Icons.video_call_sharp),
      //   activeColorPrimary: greenish,
      //   activeColorSecondary: white,
      //   inactiveColorPrimary: kblack,
      // ),
      PersistentBottomNavBarItem(
          icon: FaIcon(FontAwesomeIcons.clipboardList),
          iconSize: 20,
          title: ('Orders'.tr),
          textStyle: TextStyle(
              fontFamily: 'Poppins', fontSize: 10, fontWeight: FontWeight.w400),
          activeColorSecondary: greenish,
          inactiveColorPrimary: kblack,
          onPressed: (BuildContext? context) async {
            orderController.orders = [];
            await orderController.getorder();
            setState(() {
              _controller.index = 2;
            });
          }),
      PersistentBottomNavBarItem(
        icon: FaIcon(FontAwesomeIcons.gear),
        iconSize: 20,
        title: ('Settings'.tr),
        textStyle: TextStyle(
            fontFamily: 'Poppins', fontSize: 10, fontWeight: FontWeight.w400),
        activeColorSecondary: greenish,
        inactiveColorPrimary: kblack,
      ),
    ];
  }
}

@override
List<Widget> _buildScreens() {
  return [
    Home(),
    Chats_screen(),
    // Text("Video"),
    HistoryScreen(),
    Setting_screen(),
  ];
}

class Home extends StatefulWidget {
  // const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  switchfromlang(value) {
    setState(() {
      homeController.fromSelectedLanguage = value as String;
    });
  }

  switchtoLang(value) {
    setState(() {
      homeController.toSelectedLanguage = value as String;
    });
  }

  fetchUser() async {
    homeController.clear();
    await homeController.getuser();
    setState(() {});
  }

  msg() async {
    await chatController.unseenchat();
  }

  @override
  void initState() {
    fetchUser();
    msg();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    GetStorage box = GetStorage();

    return GetBuilder<HomeController>(
        builder: (controller) => Scaffold(
              body: SafeArea(
                child: Column(
                  children: [
                    MainStackCard(
                      onProfileTap: () {},
                      name: homeController.user == null
                          ? ""
                          : homeController.user!.username,
                    ),
                    Flexible(
                      child: Container(
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
                                    'Choose languages'.tr,
                                    style: TextStyle(
                                        fontSize: 23,
                                        fontWeight: FontWeight.bold,
                                        color: greenish),
                                  ),
                                ],
                              ),
                              Row(
                                // mainAxisAlignment: box.read('locale') != 'ar'
                                //     ? MainAxisAlignment.start
                                //     : MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 16),
                                    child: Directionality(
                                      textDirection: box.read('locale') != 'ar'
                                          ? TextDirection.ltr
                                          : TextDirection.rtl,
                                      child: Text(
                                        'From:'.tr,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: kblack),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Directionality(
                                textDirection:  box.read('locale') != 'ar'
                                          ? TextDirection.ltr
                                          : TextDirection.rtl,
                                child: DropdownField(
                                  selectedvalue:
                                      homeController.fromSelectedLanguage,
                                  text: 'Select an item'.tr,
                                  items: Languages(),
                                  onChange: (value) {
                                    setState(() {
                                      homeController.fromSelectedLanguage =
                                          value;
                                    });
                                  },
                                  searchController:
                                      homeController.searchController,
                                  searchInnerWidget: Container(
                                    padding: const EdgeInsets.all(12),
                                    child: TextFormField(
                                      controller:
                                          homeController.searchController,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 14,
                                        ),
                                        hintText: 'Search items',
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                    ),
                                  ),
                                  searchMatchFn: (item, searchValue) {
                                    return (item.value
                                        .toLowerCase()
                                        .contains(searchValue.toLowerCase()));
                                  },
                                  onMenuStateChange: (isOpen) {
                                    if (!isOpen) {
                                      homeController.searchController.clear();
                                    }
                                  },
                                ),
                              ),
                              Row(
                                // mainAxisAlignment: box.read('locale') != 'ar'
                                //     ? MainAxisAlignment.start
                                //     : MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 12),
                                    child: Directionality(
                                      textDirection: box.read('locale') != 'ar'
                                          ? TextDirection.ltr
                                          : TextDirection.rtl,
                                      child: Text(
                                        'To:'.tr,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: kblack),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Directionality(
                                textDirection: box.read('locale') != 'ar'
                                          ? TextDirection.ltr
                                          : TextDirection.rtl,
                                child: DropdownField(
                                  selectedvalue:
                                      homeController.toSelectedLanguage,
                                  text: 'Select an item'.tr,
                                  items: Languages(),
                                  onChange: (value) {
                                    setState(() {
                                      homeController.toSelectedLanguage = value;
                                    });
                                  },
                                  searchController:
                                      homeController.toSearchController,
                                  searchInnerWidget: Container(
                                    padding: const EdgeInsets.all(12),
                                    child: TextFormField(
                                      controller:
                                          homeController.toSearchController,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 14,
                                        ),
                                        hintText: 'Search items',
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                    ),
                                  ),
                                  searchMatchFn: (item, searchValue) {
                                    return (item.value
                                        .toLowerCase()
                                        .contains(searchValue.toLowerCase()));
                                  },
                                  onMenuStateChange: (isOpen) {
                                    if (!isOpen) {
                                      homeController.toSearchController.clear();
                                    }
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 35, bottom: 20),
                                child: LargeButton(
                                  title: 'Translate'.tr,
                                  sreenRatio: 0.9,
                                  onPressed: () {
                                    homeController.fetchVendors();
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
                    ),
                  ],
                ),
              ),
            ));
  }
}
