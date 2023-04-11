import 'package:flutter/material.dart';
import 'package:translation/values/colors.dart';

class ChatMessageCard extends StatefulWidget {
  ChatMessageCard(
      {Key? key,
      required this.msg,
      required this.name,
      required this.id,
      required this.user_id})
      : super(key: key);
  final String msg;
  final String name;
  final String id;
  final int user_id;

  @override
  State<ChatMessageCard> createState() => _ChatMessageCardState();
}

class _ChatMessageCardState extends State<ChatMessageCard> {
  bool pressAttention = false;
  bool pressIcon = false;
  // delmsgs() async {
  //   log(widget.id);
  //   await destroy.DelApi(widget.id);
  // }

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerRight,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width - 45,
          ),
          child: GestureDetector(
            onLongPress: () {
              setState(() {
                pressAttention = true;
                pressIcon = true;
              });
            },
            child: Card(
              elevation: 1,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              color: pressAttention == true
                  ? Color.fromARGB(255, 220, 44, 44)
                  : greenish,
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Stack(children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 10, right: 60, top: 5, bottom: 20),
                  child: Text(
                    widget.msg,
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
                Positioned(
                  bottom: 4,
                  right: 10,
                  child: Row(
                    children: [
                      Text(widget.name,
                          style: TextStyle(
                              fontSize: 13,
                              color: Color.fromARGB(255, 75, 75, 75))),
                      SizedBox(
                        width: 5,
                      ),
                      pressIcon == true
                          ? GestureDetector(
                              child: Icon(
                                Icons.delete,
                                size: 19,
                              ),
                              onTap: () {
                                // delmsgs();
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) => groupchat(id: widget.user_id, name: widget.name)),
                                // );
                              },
                            )
                          : Icon(
                              Icons.done_all,
                              size: 19,
                            ),
                    ],
                  ),
                )
              ]),
            ),
          ),
        ));
  }
}
