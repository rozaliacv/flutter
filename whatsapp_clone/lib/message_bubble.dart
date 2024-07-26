import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:whatsapp_clone/chatRoom.dart';


class MessageBubble extends StatelessWidget {
  final String msgs;
  final bool isMe;
 //final String time;
  MessageBubble({  required this.msgs,super.key,required this.isMe});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            width: msgs.length < 10
                ? MediaQuery.of(context).size.width * 0.25
                : MediaQuery.of(context).size.width * 0.5,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: isMe
                  ? BorderRadius.only(
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                      topLeft: Radius.circular(8))
                  : BorderRadius.only(
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
              color: isMe ? Color(0xffe1ffc7) : Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  msgs,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "7:30 pm",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Colors.grey.shade400,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(
                      width: 3,
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
