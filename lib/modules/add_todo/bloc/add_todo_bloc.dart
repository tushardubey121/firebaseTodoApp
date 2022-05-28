import 'dart:async';

import 'package:firebase_todo_app/services/todo_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'add_todo_event.dart';
import 'add_todo_state.dart';

class AddTodoBloc extends Bloc<AddTodoEvent, AddTodoState> {
  final TodoService _service = TodoService();

  AddTodoBloc() : super(AddTodoState.empty()) {
    on<AddTodo>(_onAddTodo);
  }

  FutureOr<void> _onAddTodo(AddTodo event, Emitter<AddTodoState> emit) async {
    emit(state.copyWith(isLoading: true));

    var response = await _service.addTodoItem(event.request);
    if (response.success) {
      emit(state.copyWith(isLoading: false,isSuccess: true));
    }else{
      emit(state.copyWith(isLoading: false,isSuccess: false,error: response.error));
    }
  }
}
