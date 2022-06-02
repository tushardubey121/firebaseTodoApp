import 'dart:async';

import 'package:firebase_todo_app/services/todo_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'todo_event.dart';
import 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoService _service = TodoService();

  TodoBloc() : super(TodoState.empty()) {
    on<FetchTodoList>(_onFetchTodoList);
    on<DeleteTodo>(_onDeleteTodo);
  }

  FutureOr<void> _onFetchTodoList(FetchTodoList event, Emitter<TodoState> emit) async {
    emit(state.copyWith(isLoading: true));
    var response = await _service.todoList(event.userId);
    if (response.success) {
      emit(state.copyWith(isLoading: false, todoList: response.data, deleteTodoSuccess: false));
    } else {
      emit(state.copyWith(isLoading: false, error: response.error));
    }
  }

  FutureOr<void> _onDeleteTodo(DeleteTodo event, Emitter<TodoState> emit) async {
    emit(state.copyWith(isLoading: true));
    var response = await _service.deleteTodo(event.docId);
    if (response.success) {
      emit(state.copyWith(isLoading: false, todoList: state.todoList, deleteTodoSuccess: true));
      state.copyWith(deleteTodoSuccess: false);
    } else {
      emit(state.copyWith(isLoading: false, error: response.error));
    }
  }
}
