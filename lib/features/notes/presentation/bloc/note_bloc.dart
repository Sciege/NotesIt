import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:notes_it/features/notes/domain/usecases/get_note.dart';

import '../../../../core/result/result.dart';
import '../../../../core/usecases/usecase.dart';
import '../../domain/entities/note.dart';
import '../../domain/usecases/add_note.dart';
import '../../domain/usecases/delete_note.dart';
import '../../domain/usecases/update_note.dart';
import 'note_state.dart';

part 'note_event.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  final GetNote getNote;
  final AddNote addNote;
  final UpdateNote updateNote;
  final DeleteNote deleteNote;

  // final SearchNote searchNote;
  List<Note> _allNotes = [];

  NoteBloc({
    required this.getNote,
    required this.addNote,
    required this.updateNote,
    required this.deleteNote,
  }) : super(NoteState.initial()) {
    on<GetNoteEvent>(_onGetNoteEvent);
    on<AddNoteEvent>(_onAddNoteEvent);
    on<UpdateNoteEvent>(_onUpdateNoteEvent);
    on<DeleteNoteEvent>(_onDeleteNoteEvent);
    on<SearchNoteEvent>(_onSearchNoteEvent);
  }

  void _onSearchNoteEvent(SearchNoteEvent event, Emitter<NoteState> emit) {
    if (event.query.isEmpty) {
      emit(state.copyWith(note: _allNotes));
    } else {
      final query = event.query.toLowerCase();
      final filteredNotes = _allNotes.where((note) {
        return note.title.toLowerCase().contains(query) ||
            note.content.toLowerCase().contains(query);
      }).toList();

      emit(state.copyWith(note: filteredNotes));
    }
  }

  Future<void> _onGetNoteEvent(
    GetNoteEvent event,
    Emitter<NoteState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    final result = await getNote(NoParams());

    if (result is Ok<List<Note>>) {
      emit(
        state.copyWith(
          isLoading: false,
          note: result.value,
          errorMessage: null,
        ),
      );
      //save
      _allNotes = result.value;
    } else if (result is Error<List<Note>>) {
      emit(
        state.copyWith(isLoading: false, errorMessage: result.failure.message),
      );
    }
  }

  Future<void> _onAddNoteEvent(
    AddNoteEvent event,
    Emitter<NoteState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    final result = await addNote(event.note);
    if (result is Ok) {
      add(GetNoteEvent());
    } else if (result is Error) {
      emit(
        state.copyWith(isLoading: false, errorMessage: result.failure.message),
      );
    }
  }

  Future<void> _onUpdateNoteEvent(
    UpdateNoteEvent event,
    Emitter<NoteState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    final result = await updateNote(event.note);
    if (result is Ok) {
      add(GetNoteEvent());
    } else if (result is Error) {
      emit(
        state.copyWith(isLoading: false, errorMessage: result.failure.message),
      );
    }
  }

  Future<void> _onDeleteNoteEvent(
    DeleteNoteEvent event,
    Emitter<NoteState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    final result = await deleteNote(event.note);
    if (result is Ok) {
      add(GetNoteEvent());
    } else if (result is Error) {
      emit(
        state.copyWith(isLoading: false, errorMessage: result.failure.message),
      );
    }
  }
}
// Future<void> _onAddNoteEvent(AddNoteEvent event, Emitter<NoteState> emit) async {
//   emit(const NoteState.loading());
//   final result = await addNote(event.note);
//   result.fold(
//         (failure) => emit(const NoteState.error('Failed to add note')),
//     // After success, reload the list to update UI
//         (_) => add(GetNoteEvent()),
//   );
// Future<void> _onGetNoteEvent(
//     GetTodosEvent event,
//     Emitter<TodolistState> emit,
//     ) async {
//   emit(state.copyWith(isLoading: true, errorMessage: null));
//
//   final result = await getTodo(NoParams());
//
//   if (result is Ok<List<Todolist>>) {
//     emit(state.copyWith(
//       isLoading: false,
//       todos: result.value,
//       errorMessage: null,
//     ));
//   } else if (result is Error<List<Todolist>>) {
//     emit(state.copyWith(
//       isLoading: false,
//       errorMessage: result.failure.message,
//     ));
//   }
// }

//
// }
