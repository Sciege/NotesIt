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
  final NoteLocalDataSourceImpl noteLocalDataSourceImpl;

  NoteRepositoryData({required this.noteLocalDataSourceImpl});

  Future<Result<List<Note>>> getNote() async {
    try {
      final localModel = await noteLocalDataSourceImpl.getNote();
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
      await noteLocalDataSourceImpl.addNote(model);
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
      await noteLocalDataSourceImpl.updateNote(model);
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
      noteLocalDataSourceImpl.deleteNote(model);
      return Result.ok(null);
    } on UnexpectedFailure {
      return Result.error(UnexpectedFailure('Unexpected Error'));
    } catch (e) {
      return Result.error(UnexpectedFailure(e.toString()));
    }
  }
}
