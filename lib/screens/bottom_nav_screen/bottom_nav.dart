// // ignore_for_file: prefer_typing_uninitialized_variables, unused_field, unused_element, deprecated_member_use

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:translation/screens/home/setting.dart';
// import 'package:translation/screens/home/chats.dart';
// import 'package:translation/screens/home/orderhistory.dart';
// import 'package:translation/screens/main_screen/home.dart';
// import 'package:translation/values/colors.dart';

// class Home_screen extends StatefulWidget {
//   const Home_screen({Key? key, this.selectedIndex}) : super(key: key);
//   final selectedIndex;

//   @override
//   State<Home_screen> createState() => _Home_screenState();
// }

// class _Home_screenState extends State<Home_screen> with RouteAware {
//   GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

//   // final GlobalKey<ChatsFragmentState> chatFragmentState = GlobalKey<ChatsFragmentState>();

//   int _navigationMenuIndex = 0;
//   bool _isScanning = false;

//   void _scanQR() {
//     setState(() {
//       _isScanning = true;
//     });
//   }

//   switchFragment(int index) {
//     setState(() {
//       _navigationMenuIndex = index;
//     });
//   }

//   checkForSelectedIndex() {
//     if (widget.selectedIndex != null) {
//       _navigationMenuIndex = widget.selectedIndex;
//     }
//   }

//   @override
//   void initState() {
//     checkForSelectedIndex();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     var _fragments = [
//       Home(),
//       Chats_screen(),
//       OrdrerHistory_screen(),
//       Setting_screen(),
//     ];
//     return WillPopScope(
//       onWillPop: () => Future.value(false),
//       child: Scaffold(
//         floatingActionButton: FloatingActionButton(
//           backgroundColor: greenish,
//           shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.all(Radius.circular(12))),
//           onPressed: () {},
//           // => Navigator.push(context,
//           //     new MaterialPageRoute(builder: (context) => QrCodeScreen())),
//           child: Icon(
//             Icons.video_call,
//             color: white,
//           ),
//         ),
//         floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//         body: SafeArea(
//           child: _fragments[_navigationMenuIndex],
//         ),
//         bottomNavigationBar: BottomAppBar(
//           child: SizedBox(
//             height: 60,
//             child: Row(
//               mainAxisSize: MainAxisSize.max,
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 Expanded(
//                   child: Material(
//                     color: white,
//                     child: Center(
//                       child: GestureDetector(
//                         onTap: () {
//                           setState(() {
//                             _navigationMenuIndex = 0;
//                           });
//                         },
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             SvgPicture.asset(
//                               'assets/images/home.svg',
//                               color: _navigationMenuIndex == 0
//                                   ? greenish
//                                   : Colors.black,
//                             ),
//                             Text(
//                               'home',
//                               style: TextStyle(
//                                 fontSize: 10,
//                                 color: _navigationMenuIndex == 0
//                                     ? greenish
//                                     : Colors.black,
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: Material(
//                     color: white,
//                     child: Center(
//                       child: GestureDetector(
//                         onTap: () {
//                           setState(() {
//                             _navigationMenuIndex = 1;
//                           });
//                         },
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             SvgPicture.asset(
//                               'assets/images/chat.svg',
//                               color: _navigationMenuIndex == 1
//                                   ? greenish
//                                   : Colors.black,
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.only(top: 2),
//                               child: Text(
//                                 'Chat',
//                                 style: TextStyle(
//                                   fontSize: 10,
//                                   color: _navigationMenuIndex == 1
//                                       ? greenish
//                                       : Colors.black,
//                                 ),
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Expanded(child: Container()),
//                 Expanded(
//                   child: Material(
//                     color: white,
//                     child: Center(
//                       child: GestureDetector(
//                         onTap: () {
//                           setState(() {
//                             _navigationMenuIndex = 2;
//                           });
//                         },
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             SvgPicture.asset(
//                               'assets/images/order.svg',
//                               color: _navigationMenuIndex == 2
//                                   ? greenish
//                                   : Colors.black,
//                             ),
//                             Text(
//                               'Orders',
//                               style: TextStyle(
//                                 fontSize: 10,
//                                 color: _navigationMenuIndex == 2
//                                     ? greenish
//                                     : Colors.black,
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: Material(
//                     color: white,
//                     child: Center(
//                       child: GestureDetector(
//                         onTap: () {
//                           setState(() {
//                             _navigationMenuIndex = 3;
//                           });
//                         },
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             SvgPicture.asset(
//                               'assets/images/setting.svg',
//                               color: _navigationMenuIndex == 3
//                                   ? greenish
//                                   : Colors.black,
//                             ),
//                             Text(
//                               "Settings",
//                               style: TextStyle(
//                                 fontSize: 10,
//                                 color: _navigationMenuIndex == 3
//                                     ? greenish
//                                     : Colors.black,
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
