import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:visual_notes_app/logic/notes_bloc.dart';
import 'package:visual_notes_app/ui/views/home_screen.dart';
import 'package:visual_notes_app/ui/views/new_note_screen.dart';
import 'package:visual_notes_app/ui/views/view_note_screen.dart';
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
      builder: (context, widget) => ResponsiveWrapper.builder(widget,
          maxWidth: 1200,
          minWidth: 480,
          defaultScale: true,
          breakpoints: [
            const ResponsiveBreakpoint.resize(480, name: MOBILE),
            const ResponsiveBreakpoint.autoScale(800, name: TABLET),
            const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
          ],
          background: Container(color: const Color(0xFFF5F5F5))),
      title: string_constants.appName,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<NotesBloc>(
        create: (BuildContext context) => NotesBloc(),
        child: const HomePage(),
      ),
    );
  }
}
