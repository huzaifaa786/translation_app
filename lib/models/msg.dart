class Msg {
  String? id;
  String? body;
  String? from_id;
  String? to_id;
  DateTime? dateTime;

  Msg(massage) {
    id = massage['id'];
    body = massage['body'];
    from_id = massage['from_id'];
    to_id = massage['to_id'];
    dateTime = DateTime.parse(massage['created_at']).toLocal();
  }
 
}
