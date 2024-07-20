import 'package:flutter/material.dart';


class StyleText extends StatelessWidget{
  final String text;
  const StyleText(this.text, {super.key});
  
  @override
  Widget build(context){
    
    return  Text(
               text,
              style: const TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 30.2,
                fontWeight: FontWeight.bold,
              ),
            );
  }
}