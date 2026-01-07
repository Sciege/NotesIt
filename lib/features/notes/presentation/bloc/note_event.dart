part of 'note_bloc.dart';

@immutable
sealed class NoteEvent extends Equatable {
  const NoteEvent();

  @override
  List<Object?> get props => [];
}

final class GetNoteEvent extends NoteEvent {
  //const GetNoteEvent(Object object);
}

final class AddNoteEvent extends NoteEvent {
  final Note note;

  const AddNoteEvent(this.note);

  @override
  List<Object?> get props => [note];
}

final class UpdateNoteEvent extends NoteEvent {
  final Note note;

  const UpdateNoteEvent(this.note);

  @override
  List<Object?> get props => [note];
}

final class DeleteNoteEvent extends NoteEvent {
  final Note note;

  const DeleteNoteEvent(this.note);

  @override
  List<Object?> get props => [note];
}

final class SearchNoteEvent extends NoteEvent {
  final String query;

  const SearchNoteEvent(this.query);

  @override
  List<Object?> get props => [query];
}
// part of 'note_bloc.dart';
//
// @immutable
// sealed class NoteEvent {}
//
// final class GetNoteEvent extends NoteEvent {}
//
// final class AddNoteEvent extends NoteEvent {
//   final Note note;
//   AddNoteEvent(this.note);
// }
//
// final class UpdateNoteEvent extends NoteEvent {
//   //OVERRIDE
//   final Note note;
//   UpdateNoteEvent(this.note);
// }
//
// final class DeleteNoteEvent extends NoteEvent {
//   final Note note;
//   DeleteNoteEvent(this.note);
// }
// final class SearchNoteEvent extends NoteEvent {
//   final String query;
//   SearchNoteEvent(this.query);
//   List<Object> get props => [query];
// }
//
//
