import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mytodos/services/firebase/auth.dart';
import 'package:provider/provider.dart';

import 'models/todos_models.dart';
import 'screens/settings_screen.dart';
import 'screens/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Todo>(
          create: (context) => Todo(),
        ),
        Provider<Auth>(
          create: (contect) => Auth(),
        )
      ],
      child: FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          // Check for errors
          if (snapshot.hasError) {
            debugPrint("An Error ocour");
          }

          // Once complete, show application
          if (snapshot.connectionState == ConnectionState.done) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'MyTodos',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              initialRoute: '/',
              routes: {
                '/': (context) => const HomePage(
                      title: 'MyTodos App',
                    ),
                '/settings': (context) => const SettingsScreen()
              },
            );
          }
          // Otherwise, show something while wainting
          return const Center( child: CircularProgressIndicator());
        },
      ),
    );
  }
}
