import 'package:translation/models/order.dart';
import 'package:translation/models/vendor.dart';

class Notificationn {
  int? id;
  int? user_id;
  int? vendor_id;
  String? title;
  Order? orderr;
  Vendor? vendor;
  Notificationn(notification) {
    id = notification['id'];
    title = notification['title'];
    orderr = notification['order'] != null ? Order(notification['order']) : null;;
    print('dfdfdffffffffdfdfdfdf');
    print(notification['vendor']);
    vendor = Vendor(notification['vendor']) ;
  }
}
