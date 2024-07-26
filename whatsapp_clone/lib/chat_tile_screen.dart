import 'package:flutter/material.dart';
import 'package:whatsapp_clone/chat_tiles.dart';


class ChatTilesScreen extends StatelessWidget {
  static const String id = 'chattilesscreen';

  final List<String> chat = ['anu', 'arun'];
  final List<String> img = ['images/woman.png', 'images/boy.png'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('contacts'),
        backgroundColor: const Color(0xff075e54),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ChatTiles(
            name: chat.elementAt(index),
            img: img.elementAt(index),
          );
        },
        itemCount: chat.length,
      ),
    );
  }
}
