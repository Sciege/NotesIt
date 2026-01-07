import 'package:dartz/dartz.dart';
import 'package:notes_it/core/result/result.dart';
import 'package:notes_it/features/notes/data/datasources/note_local_data_source.dart';

//import 'package:notes_it/core/error/failure.dart';
import 'package:notes_it/features/todo_list/data/datasources/todolist_local_data_source.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/note.dart';
import '../../domain/repositories/note_repository.dart';
import '../mapper/note_mapper.dart';

class NoteRepositoryData implements NoteRepository {
  final NoteLocalDataSource noteLocalDataSource;

  NoteRepositoryData({required this.noteLocalDataSource});

  Future<Result<List<Note>>> getNote() async {
    try {
      final localModel = await noteLocalDataSource.getNote();
      final domainModel = localModel.map((note) => note.toEntity()).toList();
      return Result.ok(domainModel);
    } on UnexpectedFailure {
      return Result.error(UnexpectedFailure('Unexpected Error'));
    } catch (e) {
      return Result.error(UnexpectedFailure(e.toString()));
    }
  }

  Future<Result<void>> addNote(Note note) async {
    try {
      final model = note.toModel();
      await noteLocalDataSource.addNote(model);
      return Result.ok(null);
    } on UnexpectedFailure {
      return Result.error(UnexpectedFailure('Unexpected Error'));
    } catch (e) {
      return Result.error(UnexpectedFailure(e.toString()));
    }
  }

  Future<Result<void>> updateNote(Note note) async {
    final model = note.toModel();
    try {
      await noteLocalDataSource.updateNote(model);
      return Result.ok(null);
    } on UnexpectedFailure {
      return Result.error(UnexpectedFailure('Unexpected Error'));
    } catch (e) {
      return Result.error(UnexpectedFailure(e.toString()));
    }
  }

  Future<Result<void>> deleteNote(Note note) async {
    final model = note.toModel();
    try {
      noteLocalDataSource.deleteNote(model);
      return Result.ok(null);
    } on UnexpectedFailure {
      return Result.error(UnexpectedFailure('Unexpected Error'));
    } catch (e) {
      return Result.error(UnexpectedFailure(e.toString()));
    }
  }
}
