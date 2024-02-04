import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:pro_2/data/database.dart';
import 'package:pro_2/pages/todo_page.dart';
import 'package:pro_2/util/dialogBox.dart';
import 'package:pro_2/util/todo_title.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //reference the hive box
  final _myBox = Hive.box('mybox');

  final _controller = TextEditingController();
  ToDoDatabase db = ToDoDatabase();

  @override
  void initState() {
    // TODO: implement initState
    //if this the 1st time ever openin the app, then create default data
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
      // there already exists data
    }
    super.initState();
  }

// checkBox was tap
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updataDataBase();
  }

  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updataDataBase();
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: ((context) {
          return DialogBox(
            controller: _controller,
            onSave: saveNewTask,
            onCencel: () => Navigator.of(context).pop(),
          );
        }));
  }

//delete Task
  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updataDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: Text("TO DO"),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return TodoTitle(
            taskName: db.toDoList[index][0],
            taskCompleted: db.toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
