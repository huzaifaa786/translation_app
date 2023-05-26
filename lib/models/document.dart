import 'dart:convert';

class Orderdoc {
  int? id;
  int? order_id;

  String? document;

  Orderdoc(document) {
    id = document['id'];
    order_id = document['order_id'];
    document = document['document'];
  }
}
