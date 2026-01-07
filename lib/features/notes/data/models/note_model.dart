import 'package:hive/hive.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'note_model.g.dart'; // used dart run build_runner build --delete-conflicting-outputs
part 'note_model.freezed.dart';

@freezed
class NoteModel with _$NoteModel {
  const factory NoteModel({
    required int id,
    required String title,
    required String content,
    required bool isPinned,
  }) = _NoteModel;

  factory NoteModel.fromJson(Map<String, dynamic> json) =>
      _$NoteModelFromJson(json);
}
//
// class Note with  {
//   @HiveField(0)
//   String title;
//
//   @HiveField(1)
//   String content;
//
//   @HiveField(2)
//   bool isPinned;
//
//   Note({required this.title, required this.content, this.isPinned = false});
//
//   Note.create({
//     required this.title,
//     required this.content,
//     this.isPinned = false,
//   });
//
// }
