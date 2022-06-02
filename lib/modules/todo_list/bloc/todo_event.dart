import 'package:equatable/equatable.dart';

abstract class TodoEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchTodoList extends TodoEvent {
  final String userId;

  FetchTodoList({required this.userId});

  @override
  String toString() {
    return '''
    FetchTodoList(
     userId:$userId,
    )
    ''';
  }
}

class DeleteTodo extends TodoEvent {
  final String docId;

  DeleteTodo({required this.docId});

  @override
  String toString() {
    return '''
    DeleteTodo(
     docId:$docId,
    )
    ''';
  }
}
