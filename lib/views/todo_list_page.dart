import 'package:flutter/material.dart';
import 'package:mvvm_example/providers/theme_provider.dart';
import 'package:mvvm_example/viewmodels/todo_viewmodel.dart';
import 'package:mvvm_example/views/todo_item_widget.dart';
import 'package:provider/provider.dart';

class TodoListPage extends StatelessWidget {
  const TodoListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('할 일 목록'),
      ),
      body: Consumer<TodoViewModel>(
        builder: (context, todoViewModel, child) {
          if (todoViewModel.todos.isEmpty) {
            return const SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                ],
              ),
            );
          } else {
            return ListView.builder(
              itemCount: todoViewModel.todos.length,
              itemBuilder: (context, index) {
                final todo = todoViewModel.todos[index];
                return TodoItemWidget(todo: todo);
              },
            );
          }
        },
      ),
      floatingActionButton: Consumer<ThemeProvider>(
        builder: (context, themeProvider, _) {
          return FloatingActionButton(
            onPressed: () {
              themeProvider.toggleDarkMode();
            },
            child: const Icon(Icons.lightbulb_outline),
          );
        },
      ),
    );
  }
}
