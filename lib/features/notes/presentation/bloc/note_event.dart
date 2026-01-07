part of 'note_bloc.dart';

@immutable
sealed class NoteEvent {}

final class GetNoteEvent extends NoteEvent {}

final class AddNoteEvent extends NoteEvent {
  final Note note;
  AddNoteEvent(this.note);
}

final class UpdateNoteEvent extends NoteEvent {
  //OVERRIDE
  final Note note;
  UpdateNoteEvent(this.note);
}

final class DeleteNoteEvent extends NoteEvent {
  final Note note;
  DeleteNoteEvent(this.note);
}