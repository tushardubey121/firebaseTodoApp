import 'package:firebase_todo_app/modules/authentication/bloc/app_event.dart';
import 'package:firebase_todo_app/modules/todo_list/todo_list_page.dart';
import 'package:firebase_todo_app/utils/app_colors.dart';
import 'package:firebase_todo_app/utils/app_images.dart';
import 'package:firebase_todo_app/utils/app_strings.dart';
import 'package:firebase_todo_app/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/app_bloc.dart';
import 'bloc/app_state.dart';

class SplashPage extends StatefulWidget {

  static String route() => 'SplashPage';

  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<AppBloc>(context).add(UserStatus());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppBloc,AppState>(
      listener: _handleState,
      buildWhen: (currentState,newState) => mounted,
      builder: (BuildContext context, state) {
        return Scaffold(
          body: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            alignment: Alignment.center,
            color: AppColors.color0xFF3465CD,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(AppStrings.appName,style: AppTextStyles.of(context).text50w700(AppColors.color0xFFFFFFFF)),
                !state.showButton ? const SizedBox():  _loginButton(context)

              ],
            ),
          ),
        );
      },
    );
  }

  _loginButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:30.0),
      child: InkWell(
        child: Image.asset(AppImages.google),
        onTap: (){
          BlocProvider.of<AppBloc>(context).add(LoginUser());
        },
      ),
    );
  }

  void _handleState(BuildContext context, AppState state) {
    if(state.isLogin){
      Navigator.pushReplacementNamed(context, TodoListPage.route());
    }else if(state.error != null){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error??"")));
    }
  }
}
