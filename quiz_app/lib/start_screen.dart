import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child:  Column(
        mainAxisSize: MainAxisSize.min,
        children:[
          Image.asset('assets/quiz-logo.png',
          width:300,
          ),
          const SizedBox(height: 50,),
          const Text('Learn Flutter!',
            style:TextStyle(
            color: Colors.white,
            fontSize: 50,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic
            )
          ),
          const SizedBox(height: 20),
          OutlinedButton(
            onPressed:  startQuiz, 
            style: OutlinedButton.styleFrom(
              side: BorderSide(
                color: Colors.black
              )
            ),
            child: const Text('Start Quiz',
            style:TextStyle(
              color: Colors.white
              )
            )
          )
        ]
      )
    );
  }
}
