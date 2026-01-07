import 'package:dartz/dartz.dart';
import 'package:notes_it/core/error/failures.dart';
import 'package:notes_it/core/result/result.dart';
import 'package:notes_it/core/usecases/usecase.dart';
import 'package:notes_it/features/notes/domain/entities/note.dart';
import 'package:notes_it/features/notes/domain/repositories/note_repository.dart';
import 'package:notes_it/features/todo_list/domain/entities/todolist.dart';
import 'package:notes_it/features/todo_list/domain/repositories/todolist_repository.dart';

class GetNote  {
  final NoteRepository noteRepository;

  GetNote(this.noteRepository);

  @override
  Future<Result<List<Note>>> call(NoParams params) async {
    return await noteRepository.getNote();
  }
}
