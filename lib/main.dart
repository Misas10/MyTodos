import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'services/appWrite/app_write.dart';
import 'models/todos_models.dart';
import 'screens/todos_screen.dart';
import 'screens/settings_screen.dart';
import 'widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Todo(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MyTodos',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const MyHomePage(
                title: 'MyTodos App',
              ),
          '/settings': (context) => const SettingsScreen()
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final addTodoTextFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        widget.title,
        actions: <Widget>[
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
        onPressed: () async => AppWrite.instance.createAccount,
      ),
    );
  }

  Future<void> _addNewTodo() async {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Add new Todo"),
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
      ),
    );
  }
}
