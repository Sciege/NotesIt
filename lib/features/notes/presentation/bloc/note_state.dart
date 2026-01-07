//part of 'note_bloc.dart';
import 'package:notes_it/features/notes/domain/entities/note.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'note_state.freezed.dart';


@freezed
class NoteState with _$NoteState {
  const factory NoteState({
    @Default([]) List<Note> note,
    @Default(false) bool isLoading,
    String? errorMessage,
  }) = _NoteState;

  factory NoteState.initial() => const NoteState();
}