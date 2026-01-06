import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/result/result.dart';
import '../../domain/entities/note.dart';
import '../repositories/note_repository.dart';

class DeleteNote {
  final NoteRepository noteRepository;

  DeleteNote(this.noteRepository);

  @override
  Future<Result<void>> call(Note params) async {
    return await noteRepository.deleteNote(params);
  }
}
