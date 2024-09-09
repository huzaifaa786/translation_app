// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
import '../freeitem.dart/free_items.dart';

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
        navBarStyle: NavBarStyle.style12,
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
        icon: SvgPicture.asset(
          "assets/icons/home2.svg",
          height: Get.height * 0.09,
          fit: BoxFit.scaleDown,
        ),
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
                child: SvgPicture.asset(
                  "assets/icons/chaticon.svg",
                  fit: BoxFit.contain,
                  height: 35,
                  width: 41,
                ),
              )
            : SvgPicture.asset(
                "assets/icons/chaticon.svg",
                fit: BoxFit.contain,
                height: 35,
                width: 41,
              ),
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
          icon: SvgPicture.asset(
            "assets/icons/orders23.svg",
            fit: BoxFit.scaleDown,
          ),
          iconSize: 0.5,
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
        icon: SvgPicture.asset("assets/icons/setting.svg"),
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
                child: Stack(
                  children: [
                    MainStackCard(
                      onProfileTap: () {},
                      name: homeController.user == null
                          ? ""
                          : homeController.user!.username,
                    ),
                    Positioned(
                      top: 140,
                      left: 20,
                      right: 20,
                      child: Container(
                        decoration: BoxDecoration(
                          color: ggrey,
                          boxShadow: [
                            BoxShadow(color: Colors.black, blurRadius: 4)
                          ],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.only(left: 13, right: 13),
                        height: box.read('locale') != 'ar'
                            ? Get.height * 0.56
                            : Get.height * 0.58,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 10, bottom: 30),
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: GestureDetector(
                                    onTap: () {
                                      Get.to(() => FreeItems());
                                    },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 59,
                                      decoration: BoxDecoration(
                                        color: Color.fromARGB(255, 16, 54, 78),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black
                                                .withOpacity(0.0824137),
                                            blurRadius: 15,
                                            offset: Offset(0, 4),
                                          ),
                                        ],
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                                color:
                                                    greenish.withOpacity(0.2),
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: Image.asset(
                                                "assets/images/Google Translate.png"),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20, right: 20),
                                            child: Text(
                                              "Free item".tr,
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Choose languages'.tr,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
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
                                    padding: const EdgeInsets.only(
                                        top: 16, left: 12, right: 12),
                                    child: Directionality(
                                      textDirection: box.read('locale') != 'ar'
                                          ? TextDirection.ltr
                                          : TextDirection.rtl,
                                      child: Text(
                                        'From:'.tr,
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                            color: greenish),
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
                                      homeController.fromSelectedLanguage,
                                  text: 'Select Language'.tr,
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
                                        hintText: 'Search items'.tr,
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
                                    padding: const EdgeInsets.only(
                                        top: 12, left: 12, right: 12),
                                    child: Directionality(
                                      textDirection: box.read('locale') != 'ar'
                                          ? TextDirection.ltr
                                          : TextDirection.rtl,
                                      child: Text(
                                        'To:'.tr,
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                            color: greenish),
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
                                  text: 'Select Language'.tr,
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
                                        hintText: 'Search items'.tr,
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
                                padding: EdgeInsets.only(top: 50, bottom: 20),
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
