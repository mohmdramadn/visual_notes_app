import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visual_notes_app/constants/string_constants.dart'
    as string_constants;
import 'package:visual_notes_app/logic/notes_bloc.dart';
import 'package:visual_notes_app/logic/notes_event.dart';
import 'package:visual_notes_app/logic/notes_state.dart';
import 'package:visual_notes_app/ui/widgets/notes_card.dart';

import 'new_note_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<NotesBloc>(context).add(ViewAllNotesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(string_constants.appName),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BlocProvider<NotesBloc>(
                  create: (BuildContext context) => NotesBloc(),
                  child: const NewNotePage(),
                ),
              ));
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
              child: BlocConsumer<NotesBloc, NotesState>(
                listener: (context, state) {},
                builder: (context, state) {
                  if (state is ViewAllNotesState) {
                    return ListView.builder(
                        itemCount: state.notes.length,
                        itemBuilder: (BuildContext context, int index) {
                          print(state.notes[index].picture);
                          return InkWell(
                            onTap: () {
                              BlocProvider.of<NotesBloc>(context)
                                  .add(ViewNoteEvent(noteIndex: index));
                            },
                            child: NoteCard(
                              noteImg: state.notes[index].picture,
                              noteTitle: state.notes[index].title,
                              noteDesc: state.notes[index].description,
                            ),
                          );
                        });
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
