import 'package:hive_flutter/adapters.dart';

class ToDoDatabase{

  List todoList = [];

  final _myBox = Hive.box("mybox");

  //first time ever opening app
  void createInitialData(){
    todoList = [
      ["Make App", false],
      ["Exercise", false]
    ];
  }

  void loadData(){
    todoList = _myBox.get("TODOLIST");
  }

  void updateDatabase(){
    _myBox.put("TODOLIST", todoList);
  }
}