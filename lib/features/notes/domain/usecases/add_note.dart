import 'package:equatable/equatable.dart';

import 'package:notes_it/core/result/result.dart';
import 'package:notes_it/features/notes/domain/entities/note.dart';
import 'package:notes_it/features/notes/domain/repositories/note_repository.dart';

class AddNote  {
  final NoteRepository noteRepository;

  AddNote(this.noteRepository);

  Future<Result<void>> call(Note params) async {
    return await noteRepository.addNote(params);
  }
}
