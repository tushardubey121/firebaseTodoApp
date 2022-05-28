
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