part of 'todolist_bloc.dart';

@immutable
sealed class TodolistEvent {}

final class GetTodosEvent extends TodolistEvent {}

final class AddTodoEvent extends TodolistEvent {
  final Todolist todo;
  AddTodoEvent(this.todo);
}

final class UpdateTodoEvent extends TodolistEvent {
  //final int id;
  final Todolist todo;
  UpdateTodoEvent(this.todo);
}

final class DeleteTodoEvent extends TodolistEvent {
  final Todolist todo;
  DeleteTodoEvent(this.todo);
}