import 'package:equatable/equatable.dart';
import 'package:firebase_todo_app/modules/authentication/models/user_model.dart';

class AppState extends Equatable {
  final bool isLogin;
  final bool showButton;
  final UserModel? userDetail;
  final String? error;

  const AppState({
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

  AppState copyWith({
    required isLogin,
    required userDetail,
    required showButton,
    error,
  }) {
    return AppState(
      isLogin: isLogin ?? this.isLogin,
      showButton: showButton ?? this.showButton,
      userDetail: userDetail ?? userDetail,
      error: error ?? error,
    );
  }

  factory AppState.empty() {
    return const AppState(
      isLogin: false,
      showButton: false,
      userDetail: null,
      error: null,
    );
  }
}
