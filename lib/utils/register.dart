import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormField(
      builder: (state) => Column(
        children: const <Widget>[
          TextField(
            decoration: InputDecoration(
              icon: Icon(Icons.account_circle),
              label: Text("Nome"),
            ),
          ),
          TextField(
            decoration: InputDecoration(
              icon: Icon(Icons.mail),
              label: Text("Email"),
            ),
          ),
          TextField(
            decoration: InputDecoration(
              icon: Icon(Icons.lock),
              label: Text("Palavra-Passe"),
            ),
          ),
        ],
      ),
    );
  }
}
