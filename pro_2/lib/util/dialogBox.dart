import 'package:flutter/material.dart';
import 'package:pro_2/util/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCencel;

  DialogBox({super.key,required this.controller,required this.onSave,required this.onCencel});

  

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow,
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add a new task",
              ),
            ),

            //button save and exit
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //save
                MyButton(text: "Save", onPressed: onSave),
                const SizedBox(width: 4,),
                MyButton(text: "Cancel", onPressed:onCencel)
                //cancel
              ],
            ),
          ],
        ),
      ),
    );
  }
}
