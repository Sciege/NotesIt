import 'package:notes_it/core/error/failures.dart';
import 'package:notes_it/core/result/result.dart';
import 'package:notes_it/features/todo_list/domain/entities/todolist.dart';

abstract class TodolistRepository {
  Future<Result<List<Todolist>>> getTodos();

  Future<Result<void>> addTodo(Todolist todo);

  Future<Result<void>> updateTodo(Todolist todo);

  Future<Result<void>> deleteTodo(Todolist todo);
}
