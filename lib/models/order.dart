import 'package:translation/models/user.dart';
import 'package:translation/models/vendor.dart';

class Order {
  int? id;
  int? user_id;
  int? price;
  String? servicetype;
  String? documenttype;
  String? status;
  String? starttime;
  String? endtime;
  String? date;
  String? vendor_id;
  User? user;
  Vendor? vendor;
  //  Orderdoc? document;

  Order(order) {
    id = order['id'];
    price = order['price'];
    servicetype = order['servicetype'];
    documenttype = order['documenttype'];
    status = order['status'];
    vendor_id = order['vendor_id'];
    starttime = order['starttime'];
    endtime = order['endtime'];
    date = order['date'];
    user_id = order['user_id'];
    user = User(order['user']);
    vendor = Vendor(order['vendor']);
    // document =  Orderdoc(order['document']) ;
  }
}
