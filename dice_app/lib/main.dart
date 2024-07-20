import 'package:flutter/material.dart';
import 'package:dice_app/gradient_container.dart';
void main() {
  runApp(
     const MaterialApp(
      home: Scaffold(
        body: GradientContainer( [Color.fromARGB(255, 213, 163, 222),
                Color.fromRGBO(217, 137, 208, 0.729),
                Color.fromARGB(255, 204, 73, 227),]), 
      ),
    ),
  );
}

