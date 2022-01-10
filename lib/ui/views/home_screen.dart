import 'package:flutter/material.dart';
import 'package:visual_notes_app/constants/string_constants.dart'
    as string_constants;
import 'package:visual_notes_app/ui/widgets/notes_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
        child: Column(
          children: [
            const Expanded(
              flex: 1,
              child: SizedBox(
                child: Center(
                    child: Text(
                  'Notes',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                )),
              ),
            ),
            Expanded(
              flex: 5,
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return const NoteCard();
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
