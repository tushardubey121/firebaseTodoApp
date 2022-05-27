import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_todo_app/utils/app_route.dart';
import 'package:firebase_todo_app/utils/app_strings.dart';
import 'package:firebase_todo_app/utils/preference.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'modules/authentication/bloc/app_bloc.dart';
import 'modules/authentication/splash_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp().then((value) {
    Preference().load().then((value) {
      runApp(MyApp());
    });
  });
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppBloc>(create: (_) => AppBloc()),
      ],
      child: MaterialApp(
        theme: ThemeData(),
        title: AppStrings.appName,
        debugShowCheckedModeBanner: false,
        routes: AppRouter.initRouter(navigatorKey),
        home: const SplashPage(),
      ),
    );
  }
}
