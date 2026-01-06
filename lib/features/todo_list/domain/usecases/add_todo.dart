import 'package:equatable/equatable.dart';

import 'package:notes_it/core/result/result.dart';
import 'package:notes_it/features/todo_list/domain/entities/todolist.dart';
import 'package:notes_it/features/todo_list/domain/repositories/todolist_repository.dart';

class AddTodo  {
  final TodolistRepository repository;

  AddTodo(this.repository);

  Future<Result<void>> call(Todolist params) async {
    return await repository.addTodo(params);
  }
}

// class AddTodoParams extends Equatable {
//   final Todolist todo;
//
//   const AddTodoParams({required this.todo});
//
//   @override
//   List<Object?> get props => [todo];
// }
