
import 'package:flutter/material.dart';
import 'package:quiz_app/result.dart';
import 'package:quiz_app/data/questions.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key , required this.chooseAnswers , required this.onRestart} );

  
  final List<String> chooseAnswers;
  final void Function() onRestart;

  List<Map<String, Object>> getSummaryData() {
      final List<Map<String, Object>> summary =[];

      for(var i = 0; i< chooseAnswers.length;i++) {
        summary.add({
          'qn_index':i,
          'question':questions[i].text,
          'correct_ans': questions[i].answers[0],
          'user_ans':chooseAnswers[i]
        });
      }

      return summary;
  }

  @override
  Widget build(context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_ans'] == data['correct_ans'];
    }).length ;


    return  SizedBox(
      width: double.infinity,
      child: Center(
        child: Container(
          margin: EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!',
              style:TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.white
                )
              ),
              SizedBox(height: 20),
              Result(summaryData),
              TextButton.icon(
                onPressed: onRestart, 
                icon:Icon(Icons.refresh,size: 30, color: Colors.black,),
                //iconAlignment: IconAlignment.start,
                label: Text('Restart Quiz',
                style: TextStyle(color:Colors.black,fontSize: 30),)
                )
            ],
          )
          
        ),
      )
    );
      
  }
}