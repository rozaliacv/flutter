import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';

class QuestionsScreen extends StatefulWidget{
  const QuestionsScreen({super.key,required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen>{
  var curentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer ) {

    widget.onSelectAnswer(selectedAnswer);
    
    setState(() {
      curentQuestionIndex ++;
    });
    

  }

  @override
  Widget build(BuildContext context){

    final curentQuestion = questions[curentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(curentQuestion.text,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ...curentQuestion.getShuffledAnswers().map((answer){
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AnswerButton(
                    answerText:answer ,
                    onTap:() {
                      answerQuestion(answer);
                    } ,
                  ),
                  SizedBox(height: 10),
                ],
              );
            }), 
          ],
        ),
      )
    );
  }
}