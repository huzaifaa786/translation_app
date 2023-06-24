import 'package:translation/models/orderr.dart';
import 'package:translation/models/vendor.dart';

class Favorites {
  int? id;
  Vendor? vendor;
  Favorites(favroite) {
    id = favroite['id'];
    vendor = Vendor(favroite['vendor']);
  }
}
