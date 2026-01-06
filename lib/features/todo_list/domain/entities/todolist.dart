import 'package:freezed_annotation/freezed_annotation.dart';

part 'todolist.freezed.dart';

@freezed
class Todolist with _$Todolist {
  const factory Todolist({
    required int? id,
    required String todolist,
    required String description,
    @Default(false) bool isDone,
  }) = _Todolist;
}
