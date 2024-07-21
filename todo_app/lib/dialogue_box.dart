import 'package:flutter/material.dart';
import 'package:todo_app/my_button.dart';

class DialogueBox extends StatelessWidget {
  final TextEditingController controller;
  VoidCallback onSave;
  VoidCallback onCancel;
   DialogueBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
    });
  @override
  Widget build(context) {
    return AlertDialog(
        backgroundColor: const Color.fromARGB(255, 82, 199, 193),
        content: SizedBox(
          height: 120,
          // width: 20,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: controller,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), 
                    hintText: "Add task",
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MyButton(text: "Save", onPressed: onSave ),
                  const SizedBox(width: 8,),
                  MyButton(text: "Cancel", onPressed: onCancel),
                ],
              )
            ],
          ),
        ));
  }
}
