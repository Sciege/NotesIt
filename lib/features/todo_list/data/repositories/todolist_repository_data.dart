import 'package:dartz/dartz.dart';
import 'package:notes_it/core/result/result.dart';

//import 'package:notes_it/core/error/failure.dart';
import 'package:notes_it/features/todo_list/data/datasources/todolist_local_data_source.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/todolist.dart';
import '../../domain/repositories/todolist_repository.dart';
import '../mapper/todolist_mapper.dart';

 class TodolistRepositoryData implements TodolistRepository {
  final TodolistLocalDataSource todolistLocalDataSource;

  TodolistRepositoryData({required this.todolistLocalDataSource});

  Future<Result<List<Todolist>>> getTodos() async {
    try {
      final localModel = await todolistLocalDataSource.getTodos();
      // use mapper
      final domainModel = localModel.map((todo) => todo.toEntity()).toList();
      // return
      return Result.ok(domainModel);
    } on UnexpectedFailure {
      return Result.error(UnexpectedFailure('Unexpected Error'));
    } catch (e) {
      return Result.error(UnexpectedFailure(e.toString()));
    }
  }

  Future<Result<void>> addTodo(Todolist todo) async {
    // from front-end so
    // entity to model
    try {
      final model = todo.toModel();
      await todolistLocalDataSource.addTodo(model);
      return Result.ok(null);
    } on UnexpectedFailure {
      return Result.error(UnexpectedFailure('Unexpected Error'));
    } catch (e) {
      return Result.error(UnexpectedFailure(e.toString()));
    }
  }

  Future<Result<void>> updateTodo(Todolist todo) async {
    // from front-end so
    // entity to model
    final model = todo.toModel();
    try {
      await todolistLocalDataSource.updateTodo(model);
      return Result.ok(null);
    } on UnexpectedFailure {
      return Result.error(UnexpectedFailure('Unexpected Error'));
    } catch (e) {
      return Result.error(UnexpectedFailure(e.toString()));
    }
  }

  Future<Result<void>> deleteTodo(Todolist todo) async {
    // from front-end so
    // entity to model
    final model = todo.toModel();
    try {
      todolistLocalDataSource.deleteTodo(model);
      return Result.ok(null);
    } on UnexpectedFailure {
      return Result.error(UnexpectedFailure('Unexpected Error'));
    } catch (e) {
      return Result.error(UnexpectedFailure(e.toString()));
    }
  }

  // Future<Either<Failure, Todolist>> getTodoById(int id);
}
