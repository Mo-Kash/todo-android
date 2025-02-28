import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:todo/components/dialog_box.dart';
import 'package:todo/components/todo_tile.dart';
import 'package:todo/data/database.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _myBox = Hive.box("mybox");
  ToDoDatabase db = ToDoDatabase();

  @override
  void initState(){
    if (_myBox.get("TODOLIST") == null){
      db.createInitialData();
    }else{
      db.loadData();
    }
  }

  final _controller = TextEditingController();

  void checkBoxChanged(bool? value, int index){
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
    db.updateDatabase();
  }

  void saveNewTask(){
    setState(() {
      db.todoList.add([_controller.text, false]);
    });
    Navigator.of(context).pop();
    db.updateDatabase();
  }

  void createNewTask(){
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onSave: saveNewTask,
            onCancel: ()=>Navigator.of(context).pop(),
          );
        }
    );
  }

  void deleteTask(int index){
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "TO DO", style: TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
          side: const BorderSide(color: Colors.amber),
        ),
        backgroundColor: Colors.deepPurple,
        child: Icon(
            Icons.add,
        ),
      ),
      body: ListView.builder(
        itemCount: db.todoList.length,
        itemBuilder: (context, index){
          return TodoTile(
            taskName: db.todoList[index][0],
            taskComplete: db.todoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
