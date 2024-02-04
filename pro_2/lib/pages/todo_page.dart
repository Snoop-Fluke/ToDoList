import 'package:flutter/material.dart';

class ToDoPage extends StatefulWidget {
  const ToDoPage({super.key});

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  TextEditingController myController = TextEditingController();

String greetingMessage="";
  void greetUser() {
String UserName = myController.text;

    setState(() {
      greetingMessage = "Hello, " + UserName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(greetingMessage),
              //testfield
              TextField(
                controller: myController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Type Your Name",
                ),
              ),

              //button
              ElevatedButton(onPressed: greetUser, child: Text("Tap"))
            ],
          ),
        ),
      ),
    );
  }
}
