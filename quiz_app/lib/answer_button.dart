import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget{
  const AnswerButton({super.key,required this.answerText,required this.onTap});

  final String answerText;
  final void Function() onTap;

  @override
  Widget build(context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
          ),
        backgroundColor: const Color.fromARGB(255, 81, 124, 159),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(40)),
      ),
      child:  Text(answerText,textAlign:TextAlign.center,),
    );
  }
}