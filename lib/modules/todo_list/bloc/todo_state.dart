import 'package:equatable/equatable.dart';
import 'package:firebase_todo_app/modules/todo_list/models/todo_model.dart';

class TodoState extends Equatable {
  final bool isLoading;
  final bool deleteTodoSuccess;
  final List<TodoModel>? todoList;
  final String? error;

  const TodoState({
    required this.isLoading,
    required this.deleteTodoSuccess,
    this.todoList,
    this.error,
  });

  @override
  List<Object?> get props => [
        isLoading,
        deleteTodoSuccess,
        todoList,
        error,
      ];

  @override
  String toString() {
    return '''
    TodoState({
    isLoading: $isLoading,
    deleteTodoSuccess: $deleteTodoSuccess,
    todoList: $todoList,
    error: $error,
    })
    ''';
  }

  TodoState copyWith({
    isLoading,
    deleteTodoSuccess,
    todoList,
    error,
  }) {
    return TodoState(
      deleteTodoSuccess: deleteTodoSuccess ?? this.deleteTodoSuccess,
      isLoading: isLoading ?? this.isLoading,
      todoList: todoList ?? this.todoList,
      error: error ?? error,
    );
  }

  factory TodoState.empty() {
    return const TodoState(
      deleteTodoSuccess: false,
      isLoading: false,
      todoList: null,
      error: null,
    );
  }
}
