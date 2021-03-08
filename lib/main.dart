import 'package:flutter/material.dart';
import 'package:vj/views/getstarted.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Orchestra',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Getstarted());
  }
}
