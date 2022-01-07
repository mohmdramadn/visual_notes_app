const String tableNotes = 'notes';

class NoteFields {
  static const String id = '_id';
  static const String title = 'title';
  static const String description = 'description';
  static const String createdDate = 'date';
  static const String picture = 'picture';
  static const String status = 'status';

  static final List<String> values = [
    id,title,description,createdDate,picture,status
  ];
}

class Note {
  final int id;
  final String title;
  final String description;
  final DateTime createdDate;
  final String picture;
  final String status;

  Note({required this.id, required this.title, required this.description, required this.createdDate,required this.picture,required this.status});

  Map<String, Object> toJson() => {
    NoteFields.id: id,
    NoteFields.title: title,
    NoteFields.picture: picture,
    NoteFields.status: status,
    NoteFields.description: description,
    NoteFields.createdDate: createdDate.toIso8601String(),
  };

  Note copy({
    int? id,
    String? title,
    String? picture,
    String? status,
    String? description,
    DateTime? createdDate,
  }) =>
      Note(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        createdDate: createdDate ?? this.createdDate,
        picture: picture ?? this.picture,
        status: status ?? this.status,
      );

  static Note fromJson(Map<String, Object?> json) => Note(
    id: json[NoteFields.id] as int,
    title: json[NoteFields.title] as String,
    description: json[NoteFields.description] as String,
    createdDate: DateTime.parse(json[NoteFields.createdDate] as String),
    picture: json[NoteFields.picture] as String,
    status: json[NoteFields.status] as String,
  );
}
