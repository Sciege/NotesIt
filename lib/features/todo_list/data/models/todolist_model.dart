// import 'package:hive/hive.dart';
// import 'package:notes_it/features/todo_list/domain/entities/todolist.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
//
  // part 'todolist_model.g.dart'; //dart run build_runner build --delete-conflicting-outputs
// part 'todolist_model.freezed.dart';
//
// @freezed
// class TodolistModel with _$TodolistModel implements Todolist {
//  // @HiveType(typeId: 1, adapterName: 'TodolistModelAdapter')
//   // @HiveField(0)
//   // String todoList;
//   //
//   // @HiveField(1)
//   // String description;
//   //
//   // @HiveField(2)
//   // bool isDone;
//   const factory TodolistModel({
//      required String todoList,
//      required String description,
//      required bool isDone,
//   }) = _TodolistModel;
//
//   factory TodolistModel.fromJson(Map<String, dynamic> json) => _$TodolistModelFromJson(json);
//
//   @override
//   // TODO: implement copyWith
//   $TodolistCopyWith<Todolist> get copyWith => throw UnimplementedError();
//
//   @override
//   // TODO: implement description
//   String get description => throw UnimplementedError();
//
//   @override
//   // TODO: implement isDone
//   bool get isDone => throw UnimplementedError();
//
//   @override
//   // TODO: implement key
//   get key => throw UnimplementedError();
//
//   @override
//   // TODO: implement todolist
//   String get todolist => throw UnimplementedError();
//
//
//   //
//   // factory TodolistModel.fromJson(Map<String, dynamic> json) => _$TodolistModelFromJson(json);
//   //
//   // TodolistModel(
//   //     {required this.todoList, required this.description, required this.isDone});
//   //
//   // TodolistModel.create(
//   //     {required this.todoList, required this.description, required this.isDone});
// }

import 'package:freezed_annotation/freezed_annotation.dart';

part 'todolist_model.freezed.dart';
part 'todolist_model.g.dart';

@freezed
class TodolistModel with _$TodolistModel {
  const factory TodolistModel({
    required int id,
    required String todoList,
    required String description,
    required bool isDone,
  }) = _TodolistModel;

  factory TodolistModel.fromJson(Map<String, dynamic> json) =>
      _$TodolistModelFromJson(json);
}