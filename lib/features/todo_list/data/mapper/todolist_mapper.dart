import 'package:notes_it/features/todo_list/data/models/todolist_model.dart';
import 'package:notes_it/features/todo_list/domain/entities/todolist.dart';

// Extension to map from the Data Model (TodolistModel) to the Domain Entity (Todolist)
// extension TodolistModelMapper on TodolistModel {
//   domain.Todolist toDomain() {
//     return domain.Todolist(
//       id: id, // The 'key' comes from HiveObject
//       todolist: todoList,
//       description: description,
//       isDone: isDone,
//     );
//   }
// }

// Extension to map from the Domain Entity (Todolist) to the Data Model (TodolistModel)
// extension TodolistEntityMapper on domain.Todolist {
//   TodolistModel toModel() {
//     return TodolistModel(
//       id: id,
//       todoList: todolist,
//       description: description,
//       isDone: isDone,
//     );
//   }
// }

extension TodolistMapper on TodolistModel {
  Todolist toEntity(
    //TodolistModel model
  ) {
    return Todolist(
      id: id,
      todolist: todoList,
      description: description,
      isDone: isDone,
    );
  }
}

extension TodolistModelMapper on Todolist {
  TodolistModel toModel() {
    return TodolistModel(
      id: id ?? 0,
      todoList: todolist,
      description: description,
      isDone: isDone,
    );
  }
}
