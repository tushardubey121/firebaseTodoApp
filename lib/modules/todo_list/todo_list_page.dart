import 'package:firebase_todo_app/utils/app_colors.dart';
import 'package:flutter/material.dart';

class TodoListPage extends StatefulWidget {
  static String route() => 'TodoListPage';

  const TodoListPage({Key? key}) : super(key: key);

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.color0xFF3465CD,
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
      body: Container(),
    );
  }
}
