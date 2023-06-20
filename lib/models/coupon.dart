class Coupon {
  int? id;
  String? name;
  String? percentage;
  String? maximum;
  String? minimum;

  Coupon(coupon) {
    id = coupon['id'];
    name = coupon['name'];
    percentage = coupon['percentage'];
    maximum = coupon['maximum'];
  }
}
