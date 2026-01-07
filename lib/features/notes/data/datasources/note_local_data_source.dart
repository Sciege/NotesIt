import 'package:hive/hive.dart';
import 'package:notes_it/features/notes/data/models/note_model.dart';

abstract class NoteLocalDataSource {
  Future<List<NoteModel>> getNote();

  Future<void> addNote(NoteModel note);

  Future<void> updateNote(NoteModel note);

  Future<void> deleteNote(NoteModel note);
}

class NoteLocalDataSourceImpl implements NoteLocalDataSource {
  final Box box;

  NoteLocalDataSourceImpl(this.box);

  @override
  Future<List<NoteModel>> getNote() {
    final note = box.toMap().entries.map((entry) {
      final hiveKey = entry.key as int;
      final data = Map<String, dynamic>.from(entry.value as Map);

      return NoteModel(
        id: hiveKey,
        title: data['title'] ?? '',
        content: data['content'] ?? '',
        isPinned: data['isPinned']?? false,
      );
    }).toList();

    return Future.value(note);
  }

  @override
  Future<void> addNote(NoteModel note) async {

    try {
      final todoJson = await box.add({
       'title': note.title,
        'content': note.content,
        'isPinned': note.isPinned,
      });
      print('SUCCESS: Box now has ${todoJson}');
      print('DATA SOURCE: Box now has ${box.length} items');
    } catch (e) {
      print('DATA SOURCE: Error adding note: $e');
      rethrow;
    }
  }

  @override
  Future<void> updateNote(NoteModel note) async {

    try {
      final noteJson = {
        'title': note.title,
        'content': note.content,
        'isPinned': note.isPinned,
      };
      await box.put(note.id!, noteJson);
      print('DATA SOURCE: Box now has ${box.length} items');
    } catch (e) {
      print('DATA SOURCE: Error updating note: $e');
      rethrow;
    }
  }

  @override
  Future<void> deleteNote(NoteModel note) {
    return box.delete(note.id);
  }
}
