import 'package:flutter/material.dart';
import 'package:mvvm_example/repositories/todo_repository.dart';

import '../models/todo.dart';

class TodoViewModel extends ChangeNotifier {
  final TodoRepository _repository = TodoRepository();
  late List<Todo> _todos = [];

  List<Todo> get todos => _todos;

  TodoViewModel() {
    _loadTodos();
  }

  Future<void> _loadTodos() async {
    await Future.delayed(const Duration(seconds: 5));
    _todos = _repository.getTodos();
    notifyListeners();
  }

  void updateTodoComplete(Todo todo) {
    final todoIndex = _todos.indexWhere((element) => element.id == todo.id);

    final todoToUpdate = _todos[todoIndex].copyWith(isCompleted: !todo.isCompleted);
    _todos[todoIndex] = todoToUpdate;
    notifyListeners();
  }
}
