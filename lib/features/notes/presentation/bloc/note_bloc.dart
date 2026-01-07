import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:notes_it/features/notes/domain/usecases/get_note.dart';

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

  NoteBloc({
    required this.getNote,
    required this.addNote,
    required this.updateNote,
    required this.deleteNote,
  }) : super(NoteState.initial()) {
    on<NoteEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
