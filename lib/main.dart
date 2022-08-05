import 'package:flutter/material.dart';
import 'package:missin_app/screens/auth/login.dart';

import 'screens/tasks.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter work Arabic',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Color(0xFFEDE7DC)
      ),
      home:  TasksScreen(),
    );
  }
}
