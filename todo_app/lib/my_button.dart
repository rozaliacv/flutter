import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  VoidCallback onPressed;
   MyButton({
    super.key,
    required this.text,
    required this.onPressed,
    });

  @override
  Widget build(context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
