import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase {
  List toDoList = [];
  //reference our box
  final _myBox = Hive.box('mybox');

// run this method if this is the 1st time ever opening this app
  void createInitialData() {
    toDoList = [
      ["Make Toturial", false],
      ["Do Exercise", false]
    ];
  }

  // load the data from database
  void loadData() {
    toDoList = _myBox.get("TODOLIST");
  }

  // update the database
  void updataDataBase() {

    _myBox.put("TODOLIST", toDoList);
  }
}
