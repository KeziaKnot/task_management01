import 'package:flutter/material.dart';
import 'package:task_management01/components/buttons.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.pink,
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          //get input
          TextField(
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Add a new task"),
          ),
          Row(
            children: [
              //save
              MyButton(text: "Save", onPressed: onSave),
              //cancel
              MyButton(text: "Cancel", onPressed: onCancel),
            ],
          ),
        ],),
      ),
    );
  }
}