import 'package:flutter/material.dart';

AppBar customAppBar(String title, {List<Widget>? actions}) {
  return AppBar(
    title: Text(title),
    centerTitle: true,
    actions: actions,
  );
}
