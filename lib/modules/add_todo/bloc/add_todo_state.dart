import 'package:equatable/equatable.dart';
import 'package:firebase_todo_app/modules/todo_list/models/todo_model.dart';

class AddTodoState extends Equatable {
  final bool isLoading;
  final bool isSuccess;
  final TodoModel? todoModel;
  final String? error;

  const AddTodoState({
    required this.isLoading,
    required this.isSuccess,
    this.todoModel,
    this.error,
  });

  @override
  List<Object?> get props => [
        isLoading,
        isSuccess,
        todoModel,
        error,
      ];

  @override
  String toString() {
    return '''
    AddTodoState({
    isLoading: $isLoading,
    isSuccess: $isSuccess,
    todoModel: $todoModel,
    error: $error,
    })
    ''';
  }

  AddTodoState copyWith({
    isLoading,
    isSuccess,
    todoModel,
    error,
  }) {
    return AddTodoState(
      isSuccess: isSuccess ?? this.isSuccess,
      isLoading: isLoading ?? this.isLoading,
      todoModel: todoModel ?? this.todoModel,
      error: error ?? error,
    );
  }

  factory AddTodoState.empty() {
    return const AddTodoState(
      isLoading: false,
      isSuccess: false,
      todoModel: null,
      error: null,
    );
  }
}
