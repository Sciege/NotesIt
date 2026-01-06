import 'package:notes_it/core/error/failures.dart';
import 'package:notes_it/core/result/result.dart';
import 'package:notes_it/features/notes/domain/entities/note.dart';

abstract class NoteRepository {
  Future<Result<List<Note>>> getNote();

  Future<Result<void>> addNote(Note note);

  Future<Result<void>> updateNote(Note note);

  Future<Result<void>> deleteNote(Note note);
}
