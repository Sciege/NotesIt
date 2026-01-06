import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:notes_it/features/todo_list/data/datasources/todolist_local_data_source.dart';
import 'package:notes_it/features/todo_list/data/repositories/todolist_repository_data.dart';
import 'package:notes_it/features/todo_list/domain/repositories/todolist_repository.dart';
import 'package:notes_it/features/todo_list/domain/usecases/get_todos.dart';
import 'package:notes_it/features/todo_list/domain/usecases/add_todo.dart';
import 'package:notes_it/features/todo_list/domain/usecases/update_todo.dart';
import 'package:notes_it/features/todo_list/domain/usecases/delete_todo.dart';
import 'package:notes_it/features/todo_list/presentation/bloc/todolist_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  if (sl.isRegistered<TodolistBloc>()) {
    return;
  }

  late Box box;
  try {
    if (Hive.isBoxOpen('todos')) {
      box = Hive.box('todos');
    } else {
      box = await Hive.openBox('todos');
    }
  } catch (e) {
    box = Hive.box('todos');
  }

  sl.registerLazySingleton<Box>(() => box);

  ///bloc
  sl.registerFactory(
    () => TodolistBloc(
      getTodo: sl(),
      addTodo: sl(),
      updateTodo: sl(),
      deleteTodo: sl(),
    ),
  );

  ///use-cases
  sl.registerLazySingleton(() => GetTodos(sl()));
  sl.registerLazySingleton(() => AddTodo(sl()));
  sl.registerLazySingleton(() => UpdateTodo(sl()));
  sl.registerLazySingleton(() => DeleteTodo(sl()));

  ///repositories
  sl.registerLazySingleton<TodolistRepository>(
    () => TodolistRepositoryData(todolistLocalDataSource: sl()),
  );

  ///data source
  sl.registerLazySingleton<TodolistLocalDataSource>(
    () => TodolistLocalDataSourceImpl(sl()),
  );
}
