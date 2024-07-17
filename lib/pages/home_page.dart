import 'package:flutter/material.dart';
import 'package:todo_app/util/dialog_box.dart';
import 'package:todo_app/util/todo_tile.dart';

class HomePage extends StatefulWidget {

  const HomePage({
    super.key, 
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // text controller

  final _controller = TextEditingController();

  // list of ToDo tasks
  List toDoList = [
    ["Make Tutorial", false],
    ["Do Excercise", false],
  ];

  // checkbox was tapped
  void checkBoxChanged (bool? value, index){
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  void saveTask(){
    setState(() {
      toDoList.add([_controller.text , false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  //create a new task
  void createTask(){
    showDialog(
      context: context, 
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  // Delete Task

  void deleteTask(int index){
    setState(() {
      toDoList.removeAt(index);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[200],
      appBar: AppBar(
        backgroundColor: Colors.purple[500],
        title: Center(
          child: Text(
            "TO DO"
          ),
        ),
        elevation: 0,
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          onPressed: createTask,
          child: Icon(Icons.add),
        ),
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskName: toDoList[index][0], 
            taskCompleted: toDoList[index][1], 
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}