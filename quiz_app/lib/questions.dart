import 'package:flutter/material.dart';

class Questions extends StatefulWidget{
  const Questions({super.key});

  @override
  State<Questions> createState() {
    return _QuestionsState();
  }
}

class _QuestionsState extends State<Questions>{

  @override
  Widget build(BuildContext context){
    return Text("this is question");
  }
}