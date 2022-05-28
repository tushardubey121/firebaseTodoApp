
import 'package:equatable/equatable.dart';
import 'package:firebase_todo_app/modules/add_todo/models/add_todo_request.dart';

abstract class AddTodoEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AddTodo extends AddTodoEvent {
  final AddTodoRequest request;

  AddTodo({required this.request});

  @override
  String toString() {
    return '''
		AddTodo({
			request: $request,
		})
	''';
  }
}