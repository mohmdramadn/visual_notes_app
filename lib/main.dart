import 'package:flutter/material.dart';
import 'package:visual_notes_app/views/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'V-Notes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:   HomePage(),
    );
  }
}

