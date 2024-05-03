import 'package:flutter/material.dart';
import 'package:mvvm_example/providers/theme_provider.dart';
import 'package:mvvm_example/viewmodels/todo_viewmodel.dart';
import 'package:mvvm_example/views/todo_list_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TodoViewModel()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            title: 'TODO APP',
            theme: themeProvider.currentTheme,
            home: const TodoListPage(),
          );
        },
      ),
    );
  }
}
