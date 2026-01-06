import 'package:hive/hive.dart';
import 'package:notes_it/features/todo_list/data/models/todolist_model.dart';

abstract class TodolistLocalDataSource {
  Future<List<TodolistModel>> getTodos();

  Future<void> addTodo(TodolistModel todo);

  Future<void> updateTodo(TodolistModel todo);

  Future<void> deleteTodo(TodolistModel todo);
}

class TodolistLocalDataSourceImpl implements TodolistLocalDataSource {
  final Box box;

  TodolistLocalDataSourceImpl(this.box);

  /// used in [todolist_model]
  /// factory TodolistModel.fromJson(Map<String, dynamic> json) =>
  ///        _$TodolistModelFromJson(json);
  @override
  Future<List<TodolistModel>> getTodos() {
    final todos = box.toMap().entries.map((entry) {
      final hiveKey = entry.key as int;
      final data = Map<String, dynamic>.from(entry.value as Map);

      return TodolistModel(
        id: hiveKey,  // Use Hive key as ID
        todoList: data['todoList'] ?? '',
        description: data['description'] ?? '',
        isDone: data['isDone'] ?? false,
      );
    }).toList();
    // final todos = box.values.toList();
    // return Future.value(todos);
    return Future.value(todos);
  }

  @override
  Future<void> addTodo(TodolistModel todo) async {
    //return box.add(todo);
    // return box.put(todo.id, todo);

    try {
      // final todoJson = {
      //   'todoList': todo.todoList,
      //   'description': todo.description,
      //   'isDone': todo.isDone,
      // };
      final todoJson = await box.add({
        'todoList': todo.todoList,
        'description': todo.description,
        'isDone': todo.isDone,
      });
      //
      // final key = await box.add(todoJson);
      // todoJson['hiveKey'] = key;
      // await box.put(key, todoJson);
      print('SUCCESS: Box now has ${todoJson}');
      print('DATA SOURCE: Box now has ${box.length} items');
    } catch (e) {
      print('DATA SOURCE: Error adding todo: $e');
      rethrow;
    }
  }

  @override
  Future<void> updateTodo(TodolistModel todo) async {
    // add and update is same .put is using overriding the existing data
    //return box.put(todo.id, todo);
    try {
      final todoJson = {
        'todoList': todo.todoList,
        'description': todo.description,
        'isDone': todo.isDone,
      };

      //final key = await box.add(todoJson);
      //  todoJson['hiveKey'] = key;
      await box.put(todo.id!, todoJson);

      print('DATA SOURCE: Box now has ${box.length} items');
    } catch (e) {
      print('DATA SOURCE: Error updating todo: $e');
      rethrow;
    }
  }

  @override
  Future<void> deleteTodo(TodolistModel todo) {
    return box.delete(todo.id);
    //return todo.delete();
  }
}
