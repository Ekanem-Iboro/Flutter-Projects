import 'package:flutter/material.dart';
import 'package:todo_app/components/reuseable/btn.dart';

class ModalDialog extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancle;
  ModalDialog(
      {super.key,
      required this.controller,
      required this.onCancle,
      required this.onSave});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(2)),
      ),
      content: SizedBox(
        height: 120,
        child: Column(
          children: [
            TextField(
              controller: controller,
              cursorColor: Colors.black12,
              style: const TextStyle(
                color: Colors.black, // Changes the color of the entered text
              ),
              decoration: const InputDecoration(
                // labelText: 'Add Task',
                // labelStyle: TextStyle(),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.black), // Default border color
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.black45,
                      width: 2.0), // Border color when focused
                ),
                border: OutlineInputBorder(),
                hintText: 'Add a new task',
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MyBtn(btnName: 'Save', onPressed: onSave),
                MyBtn(btnName: 'Cancle', onPressed: onCancle)
              ],
            )
          ],
        ),
      ),
    );
  }
}
