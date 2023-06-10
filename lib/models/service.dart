import 'dart:convert';

import 'package:translation/models/schedual.dart';

class VendorService {
  int? id;
  int? vendor_id;
  List<dynamic>? urgent;
  List<dynamic>? unurgent;
  List<Schedual>? schedual;
  String? inperson;
  String? audiovideo;
  String? onlineaudiovideoPrice;
  String? urgentprice;
  String? unurgentprice;

  VendorService(service) {
    id = service['id'];
    vendor_id = service['vendor_id'];
    inperson = service['inperson'];
    audiovideo = service['audiovideo'];
    onlineaudiovideoPrice = service['onlineaudiovideo'];
    urgentprice = service['urgentprice'];
    unurgentprice = service['unurgentprice'];
    urgent = jsonDecode(service['urgent']);
    unurgent = jsonDecode(service['unurgent']);
    schedual = schedulelist(jsonDecode(service['schedual']));
  }

  List<Schedual> schedulelist(List<dynamic> scheduleData) {
    final List<Schedual> schedualList = [];

    for (var i = 0; i < scheduleData.length; i++) {
      schedualList.add(Schedual(scheduleData[i]));
    }

    return schedualList;
  }
}
