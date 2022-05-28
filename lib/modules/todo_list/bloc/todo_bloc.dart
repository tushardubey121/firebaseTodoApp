import 'dart:async';
import 'dart:convert';

import 'package:firebase_todo_app/modules/authentication/models/user_model.dart';
import 'package:firebase_todo_app/services/authentication_service.dart';
import 'package:firebase_todo_app/services/todo_service.dart';
import 'package:firebase_todo_app/utils/preference.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'todo_event.dart';
import 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoService _service = TodoService();

  TodoBloc() : super(TodoState.empty()) {
    on<FetchTodoList>(_onFetchTodoList);
  }

  FutureOr<void> _onFetchTodoList(FetchTodoList event, Emitter<TodoState> emit) async {
    emit(state.copyWith(isLoading: true));
    var response = await _service.todoList(event.userId);
    if(response.success){
     emit(state.copyWith(isLoading: false,todoList: response.data));
    }else{
      emit(state.copyWith(isLoading: false,error: response.error));
    }
  }
}
