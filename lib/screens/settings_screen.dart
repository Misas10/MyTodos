import 'package:flutter/material.dart';
import '../widgets.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        "Settings",
      ),
      body: const Center(),
    );
  }
}
