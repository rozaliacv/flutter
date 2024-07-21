import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/database.dart';

import 'package:todo_app/dialogue_box.dart';
import 'package:todo_app/todo_tile.dart';

class HomePage extends StatefulWidget{
   const HomePage({super.key});
  @override
  State<HomePage> createState() {
    return _HomePageState();
  }
}
class _HomePageState extends State<HomePage> {
  final _myBox = Hive.box('mybox');
  ToDoDatabase db =ToDoDatabase();

  @override
  void initState() {
    if(_myBox.get("TODOLIST") == null) {
        db.createInitialData();
    }
    else{
      db.loadData();
    }

    super.initState();
  }

  final _controller = TextEditingController();
  

  //List todolist = [[]];

  void checkboxhanged(bool? value,int index) {
    setState(() {
      db.todolist[index][1]=!db.todolist[index][1];
    }); 
    db.updateDataBase(); 
  }

  void saveNewTask() {
    setState(() {
      db.todolist.add([_controller.text,false]);  
      _controller.clear();    
    });
    Navigator.of(context).pop();
  }
  void listadd() {
    showDialog(
      context: context,
       builder: (context) {
        return DialogueBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel:() => Navigator.of(context).pop() ,
        );
       },
      );
  }


  void deletetask(int index) {
    setState(() {
     db.todolist.removeAt(index); 
     
    });
    db.updateDataBase();
    
  }

   @override
  Widget build(context){
    return Scaffold(
      backgroundColor:const Color.fromARGB(159, 78, 244, 238),
      appBar: AppBar(
        centerTitle: true,
         title:const Text(
                'TO DO',
                style:  TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 30.2,
                  fontWeight: FontWeight.bold,
                  
                ),
          ),
        backgroundColor:const Color.fromARGB(255, 82, 199, 193),
         ),
          floatingActionButton: FloatingActionButton(
            onPressed: listadd ,
            child: const Icon(Icons.add),
          ),
      body: ListView.builder(
        itemCount: db.todolist.length,
        itemBuilder:(context, index) {
         return ToDoTile(
          taskname: db.todolist[index][0], 
         taskdone: db.todolist[index][1], 
          onChanged: (value) => checkboxhanged(value,index,),
          deleteFunction: (context) => deletetask(index), 
          );
        } 
      ),
    );

  }
}