import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:translation/models/schedual.dart';
import 'package:forex_conversion/forex_conversion.dart';
import 'package:translation/screens/setting/currency/currencyalert.dart';

class VendorService {
  int? id;
  String? vendor_id;
  List<dynamic>? urgent;
  List<dynamic>? unurgent;
  List<Schedual>? schedual;
  String? inperson;
  String? audiovideo;
  String? onlineaudiovideoPrice;
  String? urgentprice;
  String? unurgentprice;
  String? radius;
  String? lat;
  String? lng;
  bool? isInperson;
  bool? isAudioVideo;
  bool? isdocument;
  String? convertedPrice;

  VendorService(service) {
    id = service['id'];
    vendor_id = service['vendor_id'];
    inperson = service['inperson'];
    audiovideo = service['audiovideo'];
    urgentprice = service['urgentprice'];
    unurgentprice = service['unurgentprice'];
    radius = service['radius'];
    lat = service['latitude'];
    lng = service['longitude'];
    urgent = jsonDecode(service['urgent']);
    unurgent = jsonDecode(service['unurgent']);
    isAudioVideo = service['isAudioVideo'];
    isInperson = service['isInperson'];
    isdocument = service['isdocument'];
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

Future<String> changePrice(String price) async {
  final fx = Forex();
  GetStorage box = GetStorage();
  var currency = box.read('currency');
  double priceConverted = 0;
  await fx
      .getCurrencyConverted(
    sourceCurrency: "USD",
    destinationCurrency: currency,
    sourceAmount: double.parse(price),
  
  )
      .then((value) {
    priceConverted = value;
    
  
  });
  return priceConverted.toString();
  
}
