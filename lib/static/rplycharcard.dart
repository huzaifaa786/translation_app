import 'package:flutter/material.dart';
import 'package:translation/values/colors.dart';

class ReplyMessageCard extends StatefulWidget {
  const ReplyMessageCard({
    Key? key,
    required this.msg,this.Time,
    this.sender = true,
  }) : super(key: key);

  final String msg;
  final sender;
  final Time;
  @override
  State<ReplyMessageCard> createState() => _ReplyMessageCardState();
}

class _ReplyMessageCardState extends State<ReplyMessageCard> {
  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: widget.sender == true
            ? Alignment.centerLeft
            : Alignment.centerRight,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width - 65,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                elevation: 1,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(8),
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8))),
                color: widget.sender == true ? Colors.white : greenish,
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, top: 10, bottom: 10),
                  child: Text(
                    widget.msg,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: widget.sender == true ? Colors.black : white),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                 widget .Time.toString(),
                  style: TextStyle(
                      color: hintText,
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                ),
              )
            ],
          ),
        ));
  }
}
