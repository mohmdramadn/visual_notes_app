import 'package:flutter/material.dart';
import 'package:visual_notes_app/ui/views/home_screen.dart';
import 'constants/string_constants.dart' as string_constants;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: string_constants.appName,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:   HomePage(),
    );
  }
}

