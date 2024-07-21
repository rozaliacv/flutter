import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase{
  List todolist = [];
  final _myBox = Hive.box('mybox');

  void createInitialData(){
   todolist=[["test",false]
   ]; 
  }

  void loadData() {
    todolist = _myBox.get("TODOLIST");
  }

  void updateDataBase(){
    _myBox.put("TODOLIST", todolist);
  }
}