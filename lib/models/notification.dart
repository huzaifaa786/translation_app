import 'package:translation/models/orderr.dart';
import 'package:translation/models/vendor.dart';

class Notificationn {
  int? id;
  int? user_id;
  int? vendor_id;
  String? title;
  Orderr? orderr;
  Vendor? vendor;
  Notificationn(notification) {
    id = notification['id'];
    title = notification['title'];
    orderr = Orderr(notification['order']);
    print('dfdfdffffffffdfdfdfdf');
    print(notification['vendor']);
    vendor = Vendor(notification['vendor']) ;
  }
}
