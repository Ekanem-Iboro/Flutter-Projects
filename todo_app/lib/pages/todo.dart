import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/components/reuseable/modal_dialog.dart';
// import 'package:todo_app/components/reuseable/appbar.dart';
import 'package:todo_app/components/todo_list_tile.dart';
import 'package:todo_app/data/db.dart';

class Todo extends StatefulWidget {
  const Todo({super.key});

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  // TextEditingController myController = TextEditingController();
  final _myController = TextEditingController();
  // reference the box
  final _mybox = Hive.box('mybox');
  TodoDB db = TodoDB();

  // void createUser() {
  //   print(myController.text);
  // }
  // List todoList = [
  //   ['Task 1', true],
  //   ['Task 2', false],
  @override
  void initState() {
    super.initState();
    if (_mybox.get('TODOLIST') == null) {
      db.createInitData();
    } else {
      db.loadData();
    }
  } // ];

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
      // todoList[index][1] = value!;
    });
    db.updateData();
  }

  void saveTask() {
    if (_myController.text.trim().isEmpty) {
      return;
    }
    setState(() {
      db.todoList.add([_myController.text, false]);
      _myController.clear();
    });

    Navigator.of(context).pop();
    db.updateData();
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return ModalDialog(
            controller: _myController,
            onSave: saveTask,
            onCancle: () => Navigator.of(context).pop(),
          );
        });
  }

  void deleteTask(int index) {
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],

      // appBar: const AppbarComp(title: 'Todo').buildAppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.todoList.length,
        itemBuilder: (BuildContext context, int index) {
          return TodoListTile(
              taskName: db.todoList[index][0],
              taskCompleted: db.todoList[index][1],
              onChanged: (value) => checkBoxChanged(value, index),
              deleteTask: (context) => deleteTask(index));
        },
      ),
    );
  }
}
