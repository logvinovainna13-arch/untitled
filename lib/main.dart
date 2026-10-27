import 'package:flutter/material.dart';
import 'package:untitled/ui/todos/todo_list_screen.dart';

void main() {

  runApp(
    MaterialApp(
      home: TodoListScreen(),
      debugShowCheckedModeBanner: false,
    ),
  );
}