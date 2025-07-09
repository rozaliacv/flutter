
import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/results_screen.dart';


class Quiz extends StatefulWidget{
  const Quiz({super.key});

  @override
  State<Quiz> createState(){
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen;
  List<String> selectedAnswers =[];

  void restartQuiz(){
    setState(() {
      selectedAnswers =[];
      activeScreen=QuestionsScreen(onSelectAnswer: chooseAnswer);
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if(selectedAnswers.length == questions.length) {
      setState(() {
        final selectedAnswersCopy = List<String>.from(selectedAnswers);
        activeScreen = ResultsScreen(chooseAnswers: selectedAnswersCopy, onRestart:restartQuiz );
        
      });
      
    }
  }

 

  @override
  void initState(){
    activeScreen = StartScreen(SwitchScreen);
    super.initState();
  }

  void SwitchScreen(){
    setState(() {
      activeScreen =   QuestionsScreen(onSelectAnswer: chooseAnswer,);
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
                Color.fromARGB(255, 149, 175, 252), 
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