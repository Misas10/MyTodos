import 'package:flutter/material.dart';

class TodoModel {
  String text;
  bool isChecked;

  TodoModel(this.text, {this.isChecked = false});

  void toggle() {
    isChecked = !isChecked;
  }
}

class Todo extends ChangeNotifier {
  // bool _isChecked = false;

  final _allTodos = <TodoModel>[
    TodoModel("Trabalhos de casa"),
    TodoModel("Fazer jantar", isChecked: true)
  ];

  List<TodoModel> get allTodos => _allTodos;

  // bool isChecked(int index) => allTodos[index].isChecked;

  // String getText(int index) => allTodos[index].text;

  void addTodo(String text) {
    _allTodos.add(TodoModel(text));
    notifyListeners();
  }

  void removeTodo(int index) {
    _allTodos.removeAt(index);
    notifyListeners();
  }

  void toggleTodo(int index) {
    _allTodos[index].toggle();
    notifyListeners();
  }
}
