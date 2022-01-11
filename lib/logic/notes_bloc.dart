import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visual_notes_app/database/note_model.dart';
import 'package:visual_notes_app/database/notes_database.dart';
import 'package:visual_notes_app/logic/notes_event.dart';
import 'package:visual_notes_app/logic/notes_state.dart';

// NotesBloc manages all states changes across the entire application

class NotesBloc extends Bloc<NotesEvent, NotesState> {
  NotesBloc() : super(InitialState());

  @override
  Stream<NotesState> mapEventToState(NotesEvent event) async* {
    if (event is AddNewNoteEvent) {
      // create a new note object to save it in the database
      final note = Note(
          title: event.title,
          description: event.desc,
          createdDate: event.time,
          picture: event.pic,
          status: event.status);
      await NotesDatabase.instance.create(note);
      yield AddNoteSuccessState();
    } else if (event is EditNoteEvent) {
      // Edit already existing note
      final note = Note(
          id: event.noteIndex,
          title: event.title,
          description: event.desc,
          createdDate: event.time,
          picture: event.pic,
          status: event.status);
      await NotesDatabase.instance.update(note);
      yield EditNoteSuccessState();
    } else if (event is DeleteNoteEvent) {
      // delete specific note from database
      await NotesDatabase.instance.delete(event.noteIndex);
      yield DeleteNoteSuccessState();
    } else if (event is ViewAllNotesEvent) {
      // load all notes from the database
      yield ViewAllNotesState(await NotesDatabase.instance.readAllNotes());
    } else if (event is ViewNoteEvent) {
      // load specific note from database with it's index to view it
      Note loadedNote = await NotesDatabase.instance.readNote(event.noteIndex);
      yield ViewOneNoteState(loadedNote);
    } else {}
  }
}
