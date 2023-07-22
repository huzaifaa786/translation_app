import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:translation/screens/chat/chatdetails.dart';
import 'package:translation/screens/orderhistory/ordercontroller.dart';
import 'package:translation/static/historycard.dart';
import 'package:translation/static/topbarr.dart';
import 'package:translation/values/controllers.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  fetchOrder() async {
    orderController.orders = [];
    await orderController.getorder();
    setState(() {});
  }

  @override
  void initState() {
    fetchOrder();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: GetBuilder<OrderController>(
        builder: (controller) => Column(
          children: [
            TitleTopbarr(
              text: 'History',
            ),
            SizedBox(
              height: 23,
            ),
            controller.orders.length != 0
                ? Flexible(
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.85,
                      child: ListView.builder(
                          itemCount: controller.orders.length,
                          itemBuilder: (context, index) {
                            String stimeStr =
                                controller.orders[index].starttime!;
                            String etimeStr = controller.orders[index].endtime!;
                            DateTime stime =
                                DateFormat('H:m:s').parse(stimeStr);
                            DateTime etime =
                                DateFormat('H:m:s').parse(etimeStr);
                            String sformattedTime =
                                DateFormat('HH:mm').format(stime);
                            String eformattedTime =
                                DateFormat('HH:mm').format(etime);
                            return HistoryCard(
                              id: controller.orders[index].id,
                              name: controller.orders[index].vendor!.name,
                              image:
                                  controller.orders[index].vendor!.profilePic,
                              price: controller.orders[index].price,
                              onmsgtap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Chatdetails_screen(
                                        id: controller.orders[index].vendor!.id,
                                        name: controller
                                            .orders[index].vendor!.username,
                                        profilePic: controller
                                            .orders[index].vendor!.profilePic,
                                        screen: 'order',
                                      ),
                                    ));
                              },
                              type: controller.orders[index].servicetype,
                              status: controller.orders[index].status,
                              time: controller.orders[index].servicetype! ==
                                        'instant'
                                    ? controller.orders[index].duration.toString() + ' min'
                                    : controller.orders[index].servicetype! ==
                                            'document'
                                        ? sformattedTime
                                        : sformattedTime + '-' + eformattedTime,
                              date: controller.orders[index].date,
                            );
                          }),
                    ),
                  )
                : Flexible(
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.85,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("No Order Found!"),
                        ],
                      ),
                    ),
                  )
          ],
        ),
      )),
    );
  }
}
