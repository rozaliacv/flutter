import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget{

final String taskname;
final bool taskdone;
Function(bool?)? onChanged;
Function(BuildContext)? deleteFunction;

   ToDoTile({
    super.key,
    required this.taskname,
    required this.taskdone,
    required this.onChanged,
    required this.deleteFunction,
    });
  @override
  Widget build(context){
    return Padding(
      padding: const EdgeInsets.only(left:22,right:22,top:25),
      child: Slidable(
        endActionPane: ActionPane(
          motion:StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon:Icons.delete,
              backgroundColor: Colors.black,
              )
            ],
          ),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 82, 199, 193),
            borderRadius: BorderRadius.circular(10),
          ),
           child: Row(
             children: [
              Checkbox(
                value: taskdone,
                 onChanged: onChanged,
                 activeColor: Colors.black,
                 ),
               Text(
                taskname,
                style: TextStyle(decoration:taskdone ? 
                TextDecoration.lineThrough:TextDecoration.none ),  
               ),
             ],
           ), 
         ),
      ),
    );
  }
}