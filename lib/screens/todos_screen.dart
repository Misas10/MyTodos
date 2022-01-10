import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../models/todos_models.dart';

class TodosScreen extends StatelessWidget {
  const TodosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final List<TodoModel> _allTodos = context.watch<Todo>().allTodos;

    // Consumer necessary to use Todo provider
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Consumer<Todo>(
        builder: (context, data, child) {
          return Scaffold(
            body: ListView.separated(
              separatorBuilder: (context, _) =>
                  const Divider(color: Colors.grey),
              shrinkWrap: true,
              itemCount: data.allTodos.length,
              itemBuilder: (context, index) {
                final todo = data.allTodos[index];
                return Slidable(
                  key: Key(todo.text),
                  endActionPane: ActionPane(
                    children: [
                      const SlidableAction(
                        onPressed: null,
                        icon: Icons.edit,
                        label: "Edit",
                        backgroundColor: Colors.blue,
                      ),
                      SlidableAction(
                        onPressed: (context) {
                          data.removeTodo(index);
                        },
                        icon: Icons.delete,
                        label: "Delete",
                        backgroundColor: Colors.red,
                      )
                    ],
                    motion: const StretchMotion(),
                    dismissible: DismissiblePane(onDismissed: () {
                      data.removeTodo(index);
                    }),
                  ),
                  child: _buildTodoItem(todo, data, index),
                );
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildTodoItem(TodoModel todo, Todo data, int index) {
    return Column(
      children: [
        GestureDetector(
          child: Container(
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
              ],
            ),
            padding: const EdgeInsets.only(bottom: 10),
          ),
          onTap: () => data.toggleTodo(index),
        ),

        // A grey bar between the todos
        // Container(
        //   height: 1,
        //   width: double.infinity,
        //   color: Colors.grey,
        // ),
      ],
    );
  }
}
