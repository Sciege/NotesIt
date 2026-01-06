import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/todolist.dart';

part 'todolist_state.freezed.dart';

@freezed
class TodolistState with _$TodolistState {
  const factory TodolistState({
    @Default([]) List<Todolist> todos,
    @Default(false) bool isLoading,
    String? errorMessage,
  }) = _TodolistState;

  factory TodolistState.initial() => const TodolistState();
}