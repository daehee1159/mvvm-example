import 'dart:convert';
import '../models/todo.dart';

class TodoRepository {
  List<Todo> getTodos() {
    return [
      Todo(id: '1', title: 'Flutter 공부하기', isCompleted: false),
      Todo(id: '2', title: 'TODO 앱 만들기', isCompleted: false),
    ];
  }

  String toJson(Todo todo) => json.encode(todo.toJson());

  Todo fromJson(String jsonString) => Todo.fromJson(json.decode(jsonString));
}
