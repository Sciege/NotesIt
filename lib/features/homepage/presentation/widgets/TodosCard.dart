import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../todo_list/data/models/todolist_model.dart' as hiveTodo;
import '../../../todo_list/domain/entities/todolist.dart' as domainTodo;
import '../../../todo_list/data/mapper/todolist_mapper.dart';
import 'ToDoCard.dart';

class TodosCard extends StatelessWidget {
  final double screenHeight;
  final double screenWidth;

  const TodosCard({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight * 0.3,
      width: screenWidth * 0.41,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFF242424),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ValueListenableBuilder<Box>(
        valueListenable: Hive.box('todos').listenable(),
        builder: (context, box, _) {
          // Convert box values to domain entities
          ///[maj changes]
          // final domainTodos = box.values.map((data) {
          //   final json = Map<String, dynamic>.from(data as Map);
          //   return hiveTodo.TodolistModel.fromJson(json).toEntity();
          // }).toList();
          final domainTodos = box.toMap().entries.map((entry) {
            final hiveKey = entry.key as int;
            final data = Map<String, dynamic>.from(entry.value as Map);

            return hiveTodo.NoteModel(
              id: hiveKey, // ✅ inject Hive key
              todoList: data['todoList'] ?? '',
              description: data['description'] ?? '',
              isDone: data['isDone'] ?? false,
            ).toEntity();
          }).toList();

          // Filter not done
          final activeTodos = domainTodos.where((todo) => !todo.isDone).toList();

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // THE PERMANENT TITLE
              TextButton(
                onPressed: () {
                  //TodosPage
                  context.go('/todos_page');
                },
                child: const Text(
                  'Todos',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Expanded(
                child: activeTodos.isEmpty
                    ? const Center(
                  child: Text(
                    'No active todos',
                    style: TextStyle(color: Color(0xFFF6D14C), fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                )
                    : ListView.builder(
                  itemCount: activeTodos.length,
                  itemBuilder: (context, index) {
                    final todo = activeTodos[index];
                    return Todocard(todo: todo);
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}