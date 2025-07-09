import 'package:flutter/material.dart';

class Result extends StatelessWidget{
  const Result(this.summaryData ,{super.key});

  final List<Map<String, Object>> summaryData;


  @override
  Widget build(context) {
    return Center(
      child: SizedBox(
        height: 300,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  summaryData.map((data){
              Color clr;
              if(data['correct_ans']==data['user_ans']){
                clr = const Color.fromARGB(255, 114, 183, 116);
              }
              else{
                clr =const Color.fromARGB(255, 215, 133, 160);
              }
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: clr,
                        child: Text(((data['qn_index'] as int) +1).toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 27
                          ),
                        ),
                      ),
                      SizedBox(width:5 ,),
                      Expanded(
                        child: Text((data['question']) as String,
                        style: TextStyle(color:Colors.white,
                        fontSize: 20
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(height: 40, width: 50,),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10,),
                            Text((data['user_ans']) as String,
                              style: TextStyle(color:const Color.fromARGB(255, 151, 89, 162),
                              fontSize: 20
                              ),
                            ),
                            SizedBox(height: 10,),
                            Text((data['correct_ans']) as String,
                              style: TextStyle(color:const Color.fromARGB(255, 75, 121, 77),
                              fontSize: 20
                              ),
                            ),
                            SizedBox(height: 10,),
                          ]
                        ),
                      ),
                    ],
                  ) 
                ] 
              );                 
            }).toList(),  
          ),
        ),
      ),
    );
  }
}