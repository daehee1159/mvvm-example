import 'package:flutter/material.dart';
import 'package:mvvm_example/models/todo.dart';
import 'package:mvvm_example/viewmodels/todo_viewmodel.dart';
import 'package:provider/provider.dart';

class TodoItemWidget extends StatelessWidget {
  final Todo todo;

  const TodoItemWidget({required this.todo, super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoViewModel>(
      builder: (context, todoViewModel, _) {
        return ListTile(
          title: Text(todo.title),
          trailing: Checkbox(
            value: todo.isCompleted,
            onChanged: (value) {
              todoViewModel.updateTodoComplete(todo);
            },
          ),
        );
      },
    );
  }
}
