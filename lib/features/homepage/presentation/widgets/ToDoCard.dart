import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../todo_list/data/mapper/todolist_mapper.dart';

//import '../../data/models/todolist.dart' as hiveTodo;
import '../../../todo_list/domain/entities/todolist.dart' as domainTodo;
import '../../../todo_list/presentation/bloc/todolist_bloc.dart';

class Todocard extends StatelessWidget {
  Todocard({super.key, required this.todo});

  final domainTodo.Todolist todo;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      color: const Color(0xFF202020),
      margin: const EdgeInsets.symmetric(horizontal: 1, vertical: 5),
      child: ListTile(
        horizontalTitleGap: 0,
        contentPadding: EdgeInsets.zero,
        onTap: () {
          //TodolistPage
          context.go('/todolist_page', extra: todo);
        },
        leading: Checkbox(
          value: todo.isDone,
          activeColor: const Color(0xFFF6D14C),
          onChanged: (bool? value) {
            final updatedTodo = todo.copyWith(isDone: value ?? false);

            // Convert to Hive entity
            ///final hiveTodo_ = updatedTodo.toEntity();

            // Save to Hive
            /// final box = Hive.box<domainTodo.Todolist>('todos');
            //todo
            // recheck this
            ///box.put(todo.key, hiveTodo_ as domainTodo.Todolist);
            ///
              /// JUTS CHECK THE BOX AND CHANGE IS DONE
            context.read<TodolistBloc>().add(UpdateTodoEvent(updatedTodo));
            print("click box");
          },
        ),
        title: Text(
          todo.todolist.length >= 8
              ? todo.todolist.substring(0, 8) + '...'
              : todo.todolist,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            decoration: todo.isDone ? TextDecoration.lineThrough : null,
          ),
        ),
      ),
    );
  }
}
