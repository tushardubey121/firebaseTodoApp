import 'dart:async';

import 'package:firebase_todo_app/services/todo_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'add_todo_event.dart';
import 'add_todo_state.dart';

class AddTodoBloc extends Bloc<AddTodoEvent, AddTodoState> {
  final TodoService _service = TodoService();

  AddTodoBloc() : super(AddTodoState.empty()) {
    on<AddTodo>(_onAddTodo);
    on<FetchTodoData>(_onFetchTodoData);
    on<UpdateTodo>(_onUpdateTodo);
  }

  FutureOr<void> _onAddTodo(AddTodo event, Emitter<AddTodoState> emit) async {
    emit(state.copyWith(isLoading: true));

    var response = await _service.addTodoItem(event.request);
    if (response.success) {
      emit(state.copyWith(isLoading: false, isSuccess: true));
    } else {
      emit(state.copyWith(isLoading: false, isSuccess: false, error: response.error));
    }
  }

  FutureOr<void> _onFetchTodoData(FetchTodoData event, Emitter<AddTodoState> emit) async {
    emit(state.copyWith(isLoading: true));

    var response = await _service.todoDataById(event.docId);
    if (response.success) {
      emit(state.copyWith(isLoading: false, isSuccess: false, todoModel: response.data));
    } else {
      emit(state.copyWith(isLoading: false, isSuccess: false, error: response.error));
    }
  }

  FutureOr<void> _onUpdateTodo(UpdateTodo event, Emitter<AddTodoState> emit) async {
    emit(state.copyWith(isLoading: true));

    var response = await _service.updateTodo(event.request, event.docId);
    if (response.success) {
      emit(state.copyWith(isLoading: false, isSuccess: true, todoModel: null));
    } else {
      emit(state.copyWith(isLoading: false, isSuccess: false, error: response.error));
    }
  }
}
