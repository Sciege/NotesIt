// import 'package:flutter/material.dart';
// import 'package:notes_it/core/usecases/usecase.dart';
// //import 'package:notes_it/domain/models/todolist.dart';
// import 'package:notes_it/domain/usecases/get_todos.dart';
//
// import '../../core/error/failures.dart';
// import '../../data/models/todolist.dart';
//
// class TodolistProvider extends ChangeNotifier {
//   final GetTodos getTodos;
//
//   TodolistProvider({required this.getTodos}) {
//     eitherFailureOrTodos();
//   }
//
//   bool isLoading = false;
//   List<Todolist> _todos = [];
//   List<Todolist> get todos => _todos;
//
//   Failure? _failure;
//   Failure? get failure => _failure;
//
//   Future<void> eitherFailureOrTodos() async {
//     isLoading = true;
//     notifyListeners();
//
//     final failureOrTodos = await getTodos(NoParams());
//
//     failureOrTodos.fold(
//       (failure) {
//         _failure = failure;
//         _todos = [];
//       },
//       (todos) {
//         _failure = null;
//         _todos = todos;
//       },
//     );
//
//     isLoading = false;
//     notifyListeners();
//   }
// }
