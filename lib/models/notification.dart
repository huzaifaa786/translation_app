import 'package:translation/models/order.dart';
import 'package:translation/models/vendor.dart';

class Notificationn {
  int? id;
  int? user_id;
  int? vendor_id;
  String? title;
  Order? orderr;
  Vendor? vendor;
  String? service_type;
  Notificationn(notification) {
    id = notification['id'];
    title = notification['title'];
    service_type = notification['service_type'];
    orderr =
        notification['order'] != null ? Order(notification['order']) : null;
    ;
    print('dfdfdffffffffdfdfdfdf');
    print(notification['vendor']);
    vendor = Vendor(notification['vendor']);
  }
}
