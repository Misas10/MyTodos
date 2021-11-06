import 'package:flutter/material.dart';

AppBar customAppBar(String title, {List<Widget>? actions}) {
  return AppBar(
    title: Text(title),
    centerTitle: true,
    actions: actions,
  );
}

Future customDialog(BuildContext context,
    {List<Widget>? actions,
    Widget? content,
    required String titleText,
    TextStyle? titleTextStyle}) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(titleText),
      titleTextStyle: titleTextStyle,
      content: content,
      actions: actions,
    ),
  );
}
