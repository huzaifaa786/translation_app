import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/utils.dart';
import 'package:get_storage/get_storage.dart';
import 'package:translation/values/colors.dart';
import 'package:translation/static/topBar.dart';
import 'package:translation/screens/freeitem.dart/free_items.dart';

class MainStackCard extends StatelessWidget {
  const MainStackCard({super.key, this.onProfileTap, this.name});
  final onProfileTap;
  final name;

  @override
  Widget build(BuildContext context) {
    GetStorage box = GetStorage();
    return Stack(
      fit: StackFit.loose,
      children: [
        Container(
          // margin: EdgeInsets.only(bottom: 20),
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.25,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 16, 54, 78),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15)),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Directionality(
                textDirection: box.read('locale') != 'ar'
                    ? TextDirection.ltr
                    : TextDirection.rtl,
                child: TopBar(
                  onProfileTap: onProfileTap,
                ),
              ),
              SizedBox(
                // width: MediaQuery.of(context).size.width*0.3,
                height: MediaQuery.of(context).size.height * 0.12,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.85,
                      child: Directionality(
                        textDirection: box.read('locale') != 'ar'
                            ? TextDirection.ltr
                            : TextDirection.rtl,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            box.read('locale') != 'ar'
                                ? Text(
                                    'Hello'.tr + ',',
                                    maxLines: 2,
                                    style: TextStyle(
                                        fontSize: 23,
                                        fontWeight: FontWeight.w600,
                                        color: white),
                                  )
                                : Text(
                                    'Hello'.tr + '،',
                                    maxLines: 2,
                                    style: TextStyle(
                                        fontSize: 23,
                                        fontWeight: FontWeight.w600,
                                        color: white),
                                  ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              name,
                              maxLines: 2,
                              style: TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.w600,
                                  color: white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        // Positioned.fill(
        //   child: Align(
        //     alignment: Alignment.bottomCenter,
        //     child: GestureDetector(
        //       onTap: () {
        //         Navigator.push(
        //             context,
        //             MaterialPageRoute(
        //               builder: (context) => FreeItems(),
        //             ));
        //       },
        //       child: Container(
        //         width: 280,
        //         height: 59,
        //         decoration: BoxDecoration(
        //           color: Color.fromARGB(255, 16, 54, 78),
        //           boxShadow: [
        //             BoxShadow(
        //               color: Colors.black.withOpacity(0.0824137),
        //               blurRadius: 15,
        //               offset: Offset(0, 4),
        //             ),
        //           ],
        //           borderRadius: BorderRadius.circular(10),
        //         ),
        //         child: Row(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           children: [
        //             Container(
        //               padding: EdgeInsets.all(8),
        //               decoration: BoxDecoration(
        //                   color: greenish.withOpacity(0.2),
        //                   borderRadius: BorderRadius.circular(20)),
        //               child: SvgPicture.asset(
        //                 'assets/images/freeitem1.svg',
        //                 color: white,
        //               ),
        //             ),
        //             Padding(

        //               padding: const EdgeInsets.only(left: 20, right: 20),
        //               child: Text(
        //                 "Free item".tr,
        //                 style: TextStyle(
        //                   fontSize: 15,
        //                   color: white,
        //                 ),
        //               ),
        //             ),
        //           ],
        //         ),
        //       ),
        //     ),
        //   ),
        // )
      ],
    );
  }
}
