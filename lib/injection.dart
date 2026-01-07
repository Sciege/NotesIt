import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';

// Feature: Notes
import 'package:notes_it/features/notes/data/datasources/note_local_data_source.dart';
import 'package:notes_it/features/notes/data/repositories/note_repository_data.dart';
import 'package:notes_it/features/notes/domain/repositories/note_repository.dart';
import 'package:notes_it/features/notes/domain/usecases/add_note.dart';
import 'package:notes_it/features/notes/domain/usecases/delete_note.dart';
import 'package:notes_it/features/notes/domain/usecases/get_note.dart';
import 'package:notes_it/features/notes/domain/usecases/update_note.dart';
import 'package:notes_it/features/notes/presentation/bloc/note_bloc.dart';

// Feature: TodoList
import 'package:notes_it/features/todo_list/data/datasources/todolist_local_data_source.dart';
import 'package:notes_it/features/todo_list/data/repositories/todolist_repository_data.dart';
import 'package:notes_it/features/todo_list/domain/repositories/todolist_repository.dart';
import 'package:notes_it/features/todo_list/domain/usecases/add_todo.dart';
import 'package:notes_it/features/todo_list/domain/usecases/delete_todo.dart';
import 'package:notes_it/features/todo_list/domain/usecases/get_todos.dart';
import 'package:notes_it/features/todo_list/domain/usecases/update_todo.dart';
import 'package:notes_it/features/todo_list/presentation/bloc/todolist_bloc.dart';

// Freature PrivNotes

final sl = GetIt.instance;

Future<void> init() async {
  // if (sl.isRegistered<TodolistBloc>()) {
  //   return;
  // }
  // if(sl.isRegistered<NoteBloc>()){
  //   return;
  // }

  late Box todoBox;
  late Box noteBox;

  try {
    if (Hive.isBoxOpen('todos')) {
      todoBox = Hive.box('todos');
    } else {
      todoBox = await Hive.openBox('todos');
    }
  } catch (e) {
    todoBox = Hive.box('todos');
  }

  try {
    if (Hive.isBoxOpen('notes')) {
      noteBox = Hive.box('notes');
    } else {
      noteBox = await Hive.openBox('notes');
    }
  } catch (e) {
    noteBox = Hive.box('notes');
  }
sl.registerFactory(
        () => TodolistBloc(
      getTodo: sl(),
      addTodo: sl(),
      updateTodo: sl(),
      deleteTodo: sl(),
    ),
  );

  // Use Cases
  sl.registerLazySingleton(() => GetTodos(sl()));
  sl.registerLazySingleton(() => AddTodo(sl()));
  sl.registerLazySingleton(() => UpdateTodo(sl()));
  sl.registerLazySingleton(() => DeleteTodo(sl()));

  // Repository
  sl.registerLazySingleton<TodolistRepository>(
        () => TodolistRepositoryData(todolistLocalDataSource: sl()),
  );

  // Data Source
  sl.registerLazySingleton<TodolistLocalDataSource>(
        () => TodolistLocalDataSourceImpl(todoBox),
  );

  // Bloc (Factory)
  sl.registerFactory(
        () => NoteBloc(
      getNote: sl(),
      addNote: sl(),
      updateNote: sl(),
      deleteNote: sl(),
    ),
  );

  // Use Cases
  sl.registerLazySingleton(() => GetNote(sl()));
  sl.registerLazySingleton(() => AddNote(sl()));
  sl.registerLazySingleton(() => UpdateNote(sl()));
  sl.registerLazySingleton(() => DeleteNote(sl()));

  // Repository
  sl.registerLazySingleton<NoteRepository>(
        () => NoteRepositoryData(noteLocalDataSource: sl()),
  );

  // Data Source
  sl.registerLazySingleton<NoteLocalDataSource>(
        () => NoteLocalDataSourceImpl(noteBox),
  );
}