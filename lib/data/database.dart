import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {

  List toDoList = [];

  //reference 
  final _myBox = Hive.box('mybox');

  // run this method if this is the 1st time ever opening this app
  void createInitialData(){
    toDoList = [
      ["make tutorial", false],
      ["Do some Excercises", false]
    ];
  }

  // load the data from datrabase
  void loadData() {
    toDoList = _myBox.get("TODOLIST");
  }

  // update the database
  void updateDatabase(){
    _myBox.put("TODOLIST", toDoList);
  }


}