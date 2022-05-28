import 'package:equatable/equatable.dart';
import 'package:firebase_todo_app/modules/todo_list/models/todo_model.dart';

class TodoState extends Equatable {
  final bool isLoading;
  final List<TodoModel>? todoList;
  final String? error;

  const TodoState({
    required this.isLoading,
    this.todoList,
    this.error,
  });

  @override
  List<Object?> get props => [
        isLoading,
        todoList,
        error,
      ];

  @override
  String toString() {
    return '''
    TodoState({
    isLoading: $isLoading,
    todoList: $todoList,
    error: $error,
    })
    ''';
  }

  TodoState copyWith({
    isLoading,
    todoList,
    error,
  }) {
    return TodoState(
      isLoading: isLoading ?? this.isLoading,
      todoList: todoList ?? this.todoList,
      error: error ?? error,
    );
  }

  factory TodoState.empty() {
    return const TodoState(
      isLoading: false,
      todoList: null,
      error: null,
    );
  }
}
