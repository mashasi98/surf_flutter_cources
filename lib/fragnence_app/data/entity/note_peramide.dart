import 'package:surf_flutter_cources/fragnence_app/data/entity/note.dart';

class NotePeramide {
  List<Note> topNotes;
  List<Note> middleNotes;
  List<Note> baseNotes;

  NotePeramide(
      {required this.topNotes,
      required this.middleNotes,
      required this.baseNotes});
}
