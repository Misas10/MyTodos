import 'package:flutter/material.dart';
import 'package:mytodos/services/firebase/auth.dart';
import 'package:mytodos/utils/register.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../services/firebase/auth.dart';
import '../utils/login.dart';
import '../widgets.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isUserConnected = context.watch<Auth>().isUserConnected;

    return Scaffold(
      appBar: customAppBar(
        "Settings",
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
              child: Text(isUserConnected ? "Faça logout" : "Faça login"),
              onPressed: () => showLoginRegister(
                context,
                "Login",
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future showLoginRegister(BuildContext context, String title) {
    return Alert(
      context: context,
      title: title,
      content: const Register(),
      buttons: [
        DialogButton(
          child: const Text(
            "Login",
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        DialogButton(
          child: const Text("Registar"),
          onPressed: () => Navigator.pop(context),
        )
      ],
    ).show();
  }
}
