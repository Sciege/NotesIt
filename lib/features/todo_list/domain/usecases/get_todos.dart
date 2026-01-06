import 'package:dartz/dartz.dart';
import 'package:notes_it/core/error/failures.dart';
import 'package:notes_it/core/result/result.dart';
import 'package:notes_it/core/usecases/usecase.dart';
import 'package:notes_it/features/todo_list/domain/entities/todolist.dart';
import 'package:notes_it/features/todo_list/domain/repositories/todolist_repository.dart';

class GetTodos  {
  final TodolistRepository repository;

  GetTodos(this.repository);

  @override
  Future<Result<List<Todolist>>> call(NoParams params) async {
    return await repository.getTodos();
  }
}
