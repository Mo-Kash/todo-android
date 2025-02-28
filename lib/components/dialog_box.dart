import 'package:flutter/material.dart';
import 'package:todo/components/buttons.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;


  DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel
  });



  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.orangeAccent,
      content: Padding(
        padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
        child: Container(
          height: 110,
          child: Column(
            children: [
              TextField(
                controller: controller,
                decoration: InputDecoration(
                  fillColor: Colors.deepPurple,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurple),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurple),
                  ),
                  hintText: "Add New Task"
                ),
                style: TextStyle(
                  color: Colors.deepPurple,
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,

                children: [
                  MyButton(text: "Save", onPressed: onSave),
                  const SizedBox(width: 8,),
                  MyButton(text: "Cancel", onPressed: onCancel)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
