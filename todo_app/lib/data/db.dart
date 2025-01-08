import 'package:hive_flutter/hive_flutter.dart';

class TodoDB {
  List todoList = [];
  final _myBox = Hive.box('mybox');

  void createInitData() {
    todoList = [
      ['Make Tutorial', false],
      ['Learn Dart', true],
      ['Build App', false]
    ];
  }

  //
  void loadData() {
    todoList = _myBox.get('TODOLIST');
  }

  // update
  void updateData() {
    _myBox.put('TODOLIST', todoList);
  }
}
