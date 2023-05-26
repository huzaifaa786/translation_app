import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:translation/screens/orderhistory/ordercontroller.dart';
import 'package:translation/static/historycard.dart';
import 'package:translation/static/titletopbar.dart';
import 'package:translation/values/controllers.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  fetchOrder() async {
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
            TitleTopbar(
              text: 'History',
              ontap: () {
                Navigator.pop(context);
              },
            ),
            Column(
              children: [
                controller.orders.length != 0
                    ? Container(
                        // padding: EdgeInsets.only(left: 10),
                        height: MediaQuery.of(context).size.height * 0.85,
                        child: ListView.builder(
                          itemCount: controller.orders.length,
                            itemBuilder: (context, index) => HistoryCard(
                                  title: 'jhfgj',
                                  name: "controller.orders[index].name",
                                  image: "controller.orders[index].profilePic",
                                  price: controller.orders[index].price,
                                  type: controller.orders[index].servicetype,
                                )),
                      )
                    : Container(
                        height: MediaQuery.of(context).size.height * 0.22,
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("No Order Found!"),
                          ],
                        ),
                      ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
