import 'package:firebase_todo_app/modules/add_todo/add_todo_page.dart';
import 'package:firebase_todo_app/modules/authentication/splash_page.dart';
import 'package:firebase_todo_app/modules/todo_list/todo_list_page.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static late GlobalKey<NavigatorState> _navigatorKey;

  static initRouter(GlobalKey<NavigatorState> navigatorKey) {
    _navigatorKey = navigatorKey;

    return <String, WidgetBuilder>{
      SplashPage.route(): (BuildContext context) => const SplashPage(),
      TodoListPage.route(): (BuildContext context) => const TodoListPage(),
      AddTodoPage.route(): (BuildContext context) => AddTodoPage(
            arg: ModalRoute.of(context)!.settings.arguments as AddTodoPageArg,
          ),
    };
  }

  static NavigatorState? navigator() {
    return _navigatorKey.currentState;
  }
}
