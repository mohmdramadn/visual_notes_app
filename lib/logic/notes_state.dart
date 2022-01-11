import 'package:equatable/equatable.dart';
import 'package:visual_notes_app/database/note_model.dart';

abstract class NotesState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialState extends NotesState {}

class ViewAllNotesState extends NotesState {
  final List<Note> notes;

  ViewAllNotesState(this.notes);

  @override
  List<Object?> get props => [notes];
}

class ViewOneNoteState extends NotesState {
  final Note note;

  ViewOneNoteState(this.note);

  @override
  List<Object?> get props => [note];
}

class AddNoteSuccessState extends NotesState {}

class DeleteNoteSuccessState extends NotesState {}

class EditNoteSuccessState extends NotesState {

}

class DeleteNoteFailedState extends NotesState {}

class AddNoteFailedState extends NotesState {}

class EditNoteFailedState extends NotesState {}
