import 'package:translation/models/user.dart';
import 'package:translation/models/vendor.dart';

class Order {
  int? id;
  int? user_id;
  int? price;
  int? duration;
  String? servicetype;
  String? scheduletype;
  String? documenttype;
  String? status;
  String? starttime;
  String? endtime;
  String? date;
  String? vendor_id;
  User? user;
  Vendor? vendor;
  bool? has_rating;
  //  Orderdoc? document;

  Order(order) {
    id = order['id'];
    price = order['price'];
    servicetype = order['servicetype'];
    scheduletype = order['scheduletype'];
    documenttype = order['documenttype'];
    duration = order['duration'];
    status = order['status'];
    vendor_id = order['vendor_id'];
    starttime = order['starttime'];
    endtime = order['endtime'];
    date = order['date'];
    user_id = order['user_id'];
    has_rating = order['has_rating'] ?? false;
    user = User(order['user']) ;
    vendor = Vendor(order['vendor']);
    // document =  Orderdoc(order['document']) ;
  }
}
