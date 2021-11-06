import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/todos_models.dart';
import '../screens/todos_screen.dart';
import '../widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final addTodoTextFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        widget.title,
        actions: <Widget>[
          // Settings buttons, goes to SettingsScreen
          IconButton(
            splashRadius: 25,
            icon: const Icon(Icons.settings),
            onPressed: () => Navigator.pushNamed(context, '/settings'),
          )
        ],
      ),
      body: const TodosScreen(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add_task),
        onPressed: () async => _addNewTodo(),
      ),
    );
  }

  // Function to add a new Todo
  // Open a dialog to user so he can write the todo
  Future<void> _addNewTodo() {
    return customDialog(
      context,
      titleText: "Add new Todo",
      content: TextField(
        controller: addTodoTextFieldController,
        decoration: const InputDecoration(),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text(
            "Add",
            textAlign: TextAlign.end,
            style: TextStyle(color: Colors.white),
          ),
          style: TextButton.styleFrom(
            backgroundColor: Theme.of(context).primaryColor,
          ),
          onPressed: () {
            if (addTodoTextFieldController.text.trim().isNotEmpty) {
              Provider.of<Todo>(context, listen: false)
                  .addTodo(addTodoTextFieldController.text.trim());
            }
            Navigator.pop(context);
            addTodoTextFieldController.clear();
          },
        )
      ],
    );
  }
}
