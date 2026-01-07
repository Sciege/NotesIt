import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_it/features/private_notes/data/models/priv_notes.dart';
import 'package:notes_it/features/todo_list/data/models/todolist_model.dart';
import 'package:notes_it/features/app_theme.dart';
import 'package:notes_it/features/homepage/presentation/pages/home_page.dart';
import 'package:notes_it/features/homepage/presentation/pages/notes_page.dart';
import 'package:notes_it/features/private_notes/presentation/pages/private_notes.dart';
import 'package:notes_it/features/private_notes/presentation/pages/private_notes_list.dart';
import 'package:notes_it/features/todo_list/presentation/pages/todolist_page.dart';
import 'package:notes_it/features/todo_list/presentation/pages/todos_page.dart';
import 'package:notes_it/features/todo_list/presentation/provider/todolist_provider.dart';
import 'package:provider/provider.dart';

import 'features/notes/data/models/note_model.dart';
import 'package:notes_it/injection.dart' as di;
import 'package:go_router/go_router.dart';

import 'features/notes/domain/entities/note.dart' as domain;
import 'features/private_notes/domain/entities/priv_notes.dart'
as domainPrivNotes;
import 'features/todo_list/domain/entities/todolist.dart' as domainTodolist;
import 'features/todo_list/presentation/bloc/todolist_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  //Hive.registerAdapter(NoteAdapter());
  //Hive.registerAdapter(TodolistModelAdapter());
  Hive.registerAdapter(PrivNotesAdapter());
  //  await Hive.deleteBoxFromDisk('notes'); //to be deleted in prod
  await Hive.deleteBoxFromDisk('todos'); //to be deleted in prod
  //  await Hive.deleteBoxFromDisk('priv_notes'); //to be deleted in prod

  // await Hive.openBox<TodolistModel>('todos');
 // await Hive.openBox<Note>('notes');
  await Hive.openBox<PrivNotes>('priv_notes');
  await di.init();

  runApp(const MyApp());
}

//await di.init();
//   runApp(
//     ChangeNotifierProvider(
//       create: (context) => di.sl<TodolistProvider>(),
//       child: const MyApp(),
//     ),
//   );
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GoRouter _router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const HomePage();
        },
      ),
      GoRoute(
        path: '/todolist_page',
        builder: (BuildContext context, GoRouterState state) {
          final note = state.extra as domainTodolist.Todolist?;
          return TodolistPage(todos: note);
        },
      ),
      GoRoute(
        path: '/todos_page',
        builder: (BuildContext context, GoRouterState state) {
          return const TodosPage();
        },
      ),
      GoRoute(
        path: '/notes_page',
        builder: (BuildContext context, GoRouterState state) {
          final note = state.extra as domain.Note?;
          return NotesPage(note: note);
        },
      ),
      GoRoute(
        path: '/private_notes_list',
        builder: (BuildContext context, GoRouterState state) {
          // final note = state.extra as domainPrivNotes.PrivNotes;
          return PrivateNotesList();
        },
      ),
      GoRoute(
        path: '/private_notes',
        builder: (BuildContext context, GoRouterState state) {
          final note = state.extra as domainPrivNotes.PrivNotes?;
          return PrivateNotes(privateNotes: note);
        },
      ),
    ],
  );

  Widget build(BuildContext context) {
    return BlocProvider(  // ADD THIS
      create: (context) => di.sl<TodolistBloc>(),  // ADD THIS
      child: MaterialApp.router(  // WRAP MaterialApp.router
        theme: AppTheme.darkTheme,
        routerConfig: _router,
        debugShowCheckedModeBanner: false,
      ),
    );  // ADD THIS
  }
}
