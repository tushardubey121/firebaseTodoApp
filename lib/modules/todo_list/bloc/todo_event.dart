
import 'package:equatable/equatable.dart';

abstract class TodoEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class UserStatus extends TodoEvent {}

class LoginUser extends TodoEvent {}