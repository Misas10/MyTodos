import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../models/todos_models.dart';

class TodosScreen extends StatelessWidget {
  const TodosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final List<TodoModel> _allTodos = context.watch<Todo>().allTodos;

    // Consumer necessary to use Todo provider
    return Consumer<Todo>(
      builder: (context, data, child) {
        return Scaffold(
          body: ListView.builder(
            shrinkWrap: true,
            itemCount: data.allTodos.length,
            itemBuilder: (context, index) {
              final todo = data.allTodos[index];
              return Container(
                child: _buildTodoItem(todo, data, index),
                padding: const EdgeInsets.only(right: 18, top: 8),
              );
            },
          ),
        );
      },
    );
  }

  GestureDetector _buildTodoItem(TodoModel todo, Todo data, int index) {
    return GestureDetector(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Checkbox(
            value: todo.isChecked,
            onChanged: (_) => data.toggleTodo(index),
          ),
          Expanded(
            child: Text(
              todo.text,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 16,
                decoration: todo.isChecked
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
              ),
            ),
          ),
          Container(width: 8),
          ElevatedButton(
            child: const Text("DELETE"),
            style: ElevatedButton.styleFrom(primary: Colors.red),
            onPressed: () => data.removeTodo(index),
          ),
        ],
      ),
      onTap: () => data.toggleTodo(index),
    );
  }
}
