//import '../../domain/entities/note.dart' as domain;
import '../../domain/entities/note.dart';
import '../models/note_model.dart';
//import '../models/note_model.dart' as data;

extension NoteMapper on NoteModel {
  Note toEntity() {
    return Note(id: id, title: title, content: content, isPinned: isPinned);
  }
}

extension NoteModelMapper on Note {
  NoteModel toModel() {
    return NoteModel(
      id: id ?? 0,
      title: title,
      content: content,
      isPinned: isPinned,
    );
  }
}

//
// // Hive to Freezed (Reading from DB)
// extension NoteHiveMapper on data.Note {
//   domain.Note toDomain() {
//     return domain.Note(
//       key: key,
//       title: title,
//       content: content,
//       isPinned: isPinned,
//     );
//   }
// }
//
// //  Freezed to Hive (Saving to DB local)
// extension NoteDomainMapper on domain.Note {
//   data.Note toEntity() {
//     return data.Note.create(
//         title: title,
//         content: content,
//         isPinned: isPinned
//     );
//   }
// }
