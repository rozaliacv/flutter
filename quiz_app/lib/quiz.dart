
import 'package:flutter/material.dart';
import 'package:quiz_app/questions.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget{
  const Quiz({super.key});

  @override
  State<Quiz> createState(){
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen;

  @override
  void initState(){
    activeScreen = StartScreen(SwitchScreen);
    super.initState();
  }

  void SwitchScreen(){
    setState(() {
      activeScreen =  const Questions();
    });
  }
    
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 0, 140, 255), 
                Color.fromARGB(255, 115, 164, 250)
              ],
                begin: Alignment.topLeft,
                end:Alignment.bottomRight
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}