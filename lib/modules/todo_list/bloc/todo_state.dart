import 'package:equatable/equatable.dart';
import 'package:firebase_todo_app/modules/authentication/models/user_model.dart';

class TodoState extends Equatable {
  final bool isLogin;
  final bool showButton;
  final UserModel? userDetail;
  final String? error;

  const TodoState({
    required this.isLogin,
    required this.userDetail,
    required this.showButton,
    this.error,
  });

  @override
  List<Object?> get props => [
        isLogin,
        userDetail,
    showButton,
        error,
      ];

  @override
  String toString() {
    return '''
    AppState({
    isLogin: $isLogin,
    userDetail: $userDetail,
    showButton: $showButton,
    error: $error,
    })
    ''';
  }

  TodoState copyWith({
    required isLogin,
    required userDetail,
    required showButton,
    error,
  }) {
    return TodoState(
      isLogin: isLogin ?? this.isLogin,
      showButton: showButton ?? this.showButton,
      userDetail: userDetail ?? userDetail,
      error: error ?? error,
    );
  }

  factory TodoState.empty() {
    return const TodoState(
      isLogin: false,
      showButton: false,
      userDetail: null,
      error: null,
    );
  }
}
