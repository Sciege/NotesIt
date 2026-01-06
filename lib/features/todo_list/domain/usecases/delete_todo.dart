import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:notes_it/core/error/failures.dart';
import 'package:notes_it/core/result/result.dart';
import 'package:notes_it/core/usecases/usecase.dart';
import 'package:notes_it/features/todo_list/domain/entities/todolist.dart';
import 'package:notes_it/features/todo_list/domain/repositories/todolist_repository.dart';

class DeleteTodo {
  final TodolistRepository repository;

  DeleteTodo(this.repository);

  @override
  Future<Result<void>> call(Todolist params) async {
    return await repository.deleteTodo(params);
  }
}

// class DeleteTodoParams extends Equatable {
//   final Todolist todo;
//
//   const DeleteTodoParams({required this.todo});
//
//   @override
//   List<Object?> get props => [todo];
// }
