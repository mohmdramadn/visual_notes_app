import 'package:flutter/material.dart';
import 'package:visual_notes_app/constants/string_constants.dart' as string_constants;
import 'package:visual_notes_app/ui/widgets/notes_card.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final _contentController = TextEditingController();
  final _titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(string_constants.appName),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          //TODO: open the add new note screen
        },
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: const [
               NoteCard(),
            ],
          ),
        ),
      ),
    );
  }
}
