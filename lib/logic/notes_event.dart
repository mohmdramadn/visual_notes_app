import 'package:equatable/equatable.dart';

abstract class NotesEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialNoteEvent extends NotesEvent {}

class AddNewNoteEvent extends NotesEvent {
  final String title;
  final String desc;
  final String pic;
  final String status;
  final DateTime time;

  AddNewNoteEvent(
      {required this.title,
      required this.status,
      required this.pic,
      required this.desc,
      required this.time});

  @override
  List<Object> get props => [title, desc, status, pic, time];
}

class DeleteNoteEvent extends NotesEvent {
  final int noteIndex;


  DeleteNoteEvent(
      {required this.noteIndex});

  @override
  List<Object> get props => [noteIndex];
}

//class ViewOneNoteEvent extends NotesEvent {}

class ViewAllNotesEvent extends NotesEvent {}

class ViewNoteEvent extends NotesEvent {
  final int noteIndex;


  ViewNoteEvent(
      {required this.noteIndex});

  @override
  List<Object> get props => [noteIndex];
}

class EditNoteEvent extends NotesEvent {
  final int noteIndex;
  final String title;
  final String desc;
  final String pic;
  final String status;
  final DateTime time;


  EditNoteEvent({
    required this.noteIndex,
    required this.title,
    required this.desc,
    required this.pic,
    required this.status,
    required this.time,
  });

  @override
  List<Object> get props => [noteIndex,title, desc, status, pic, time];

}
