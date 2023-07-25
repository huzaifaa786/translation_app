class Orderr {
  int? id;
  int? user_id;
  int? price;
  int? duration;
  String? vendor_id;
  String? starttime;
  String? endtime;
  String? date;
  String? servicetype;
  String? scheduletype;
  String? status;
  bool? has_rating;

  // OrderDocument? document;

  Orderr(orderr) {
    id = orderr['id'];
    price = orderr['price'];
    servicetype = orderr['servicetype'];
    scheduletype = orderr['scheduletype'];
    duration = orderr['duration'];
    starttime = orderr['starttime'];
    endtime = orderr['endtime'];
    date = orderr['date'];
    status = orderr['status'];
    vendor_id = orderr['vendor_id'];
    user_id = orderr['user_id'];
    has_rating = orderr['has_rating'] ?? false;

    // document = OrderDocument(order['orderdocument']);
  }
}
