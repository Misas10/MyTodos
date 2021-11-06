import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormField(
      builder: (state) {
        return Column(
          children: [
            const TextField(
              decoration: InputDecoration(
                  icon: Icon(Icons.account_circle), label: Text("Email")),
            ),
            const TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.lock),
                label: Text("Palavra-Passe"),
              ),
            ),
          ],
        );
      },
    );
  }
}
