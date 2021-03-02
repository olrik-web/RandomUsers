import 'package:flutter/material.dart';
import 'UserListPage.dart';

void main() {
  runApp(MaterialApp(
    title: 'Random users',
    theme: ThemeData(
      primarySwatch: Colors.amber,
    ),
    home: UserListPage(),
    routes: {
      '/userList': (BuildContext context) => UserListPage(),
    },
  ));
}
