import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:injectable/injectable.dart';
import 'package:notes_it/core/usecases/usecase.dart';

//usecases
import '../../domain/entities/todolist.dart';
import '../../domain/usecases/get_todos.dart';
import '../../domain/usecases/add_todo.dart';
import '../../domain/usecases/update_todo.dart';
import '../../domain/usecases/delete_todo.dart';
import '../../domain/repositories/todolist_repository.dart';

import '../../../../core/result/result.dart';
import 'todolist_state.dart';

part 'todolist_event.dart';

@injectable
class TodolistBloc extends Bloc<TodolistEvent, TodolistState> {
  final GetTodos getTodo;
  final AddTodo addTodo;
  final UpdateTodo updateTodo;
  final DeleteTodo deleteTodo;  // Changed from DeleteTodoEvent to DeleteTodo

  TodolistBloc({
    required this.getTodo,
    required this.addTodo,
    required this.updateTodo,
    required this.deleteTodo,
  }) : super(TodolistState.initial()) {
    on<GetTodosEvent>(_onGetTodosEvent);
    on<AddTodoEvent>(_onAddTodoEvent);
    on<UpdateTodoEvent>(_onUpdateTodoEvent);
    on<DeleteTodoEvent>(_onDeleteTodoEvent);
  }

  Future<void> _onGetTodosEvent(
      GetTodosEvent event,
      Emitter<TodolistState> emit,
      ) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    final result = await getTodo(NoParams());

    if (result is Ok<List<Todolist>>) {
      emit(state.copyWith(
        isLoading: false,
        todos: result.value,
        errorMessage: null,
      ));
    } else if (result is Error<List<Todolist>>) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: result.failure.message,
      ));
    }
  }

  Future<void> _onAddTodoEvent(
      AddTodoEvent event,
      Emitter<TodolistState> emit,
      ) async {
    print('bloc addtodo received');
    emit(state.copyWith(isLoading: true));

    final result = await addTodo(event.todo);
    print('bloc $result');
    if (result is Ok) {
      print('bloc success');
      add(GetTodosEvent());
    } else if (result is Error) {
      print('bloc fail ${result.failure.message}');
      emit(state.copyWith(
        isLoading: false,
        errorMessage: result.failure.message,
      ));
    }
  }

  Future<void> _onUpdateTodoEvent(
      UpdateTodoEvent event,
      Emitter<TodolistState> emit,
      ) async {
    print('bloc update todo received');
    emit(state.copyWith(isLoading: true));

    final result = await updateTodo(event.todo);

    if (result is Ok) {
      print('Result of update: ${result}');
      add(GetTodosEvent());

    } else if (result is Error) {
      print('Result of update error: ${result.failure.message}');

      emit(state.copyWith(
        isLoading: false,
        errorMessage: result.failure.message,
      ));
    }
  }

  Future<void> _onDeleteTodoEvent(
      DeleteTodoEvent event,
      Emitter<TodolistState> emit,
      ) async {
    emit(state.copyWith(isLoading: true));

    final result = await deleteTodo(event.todo);

    if (result is Ok) {
      add(GetTodosEvent());
    } else if (result is Error) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: result.failure.message,
      ));
    }
  }
}