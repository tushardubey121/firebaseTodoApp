import 'package:firebase_todo_app/modules/add_todo/add_todo_page.dart';
import 'package:firebase_todo_app/modules/authentication/bloc/app_bloc.dart';
import 'package:firebase_todo_app/modules/todo_list/bloc/todo_bloc.dart';
import 'package:firebase_todo_app/modules/todo_list/bloc/todo_event.dart';
import 'package:firebase_todo_app/modules/todo_list/bloc/todo_state.dart';
import 'package:firebase_todo_app/modules/todo_list/models/todo_model.dart';
import 'package:firebase_todo_app/modules/todo_list/widgets/mountain_with_details_widget.dart';
import 'package:firebase_todo_app/modules/todo_list/widgets/todo_card.dart';
import 'package:firebase_todo_app/utils/app_colors.dart';
import 'package:firebase_todo_app/utils/app_strings.dart';
import 'package:firebase_todo_app/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoListPage extends StatefulWidget {
  static String route() => 'TodoListPage';

  const TodoListPage({Key? key}) : super(key: key);

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  late TodoBloc _todoBloc;


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _todoBloc = TodoBloc();
    _todoBloc.add(FetchTodoList(userId: BlocProvider.of<AppBloc>(context).state.userDetail?.userId??""));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.color0xFF3465CD,
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, AddTodoPage.route()).then((value){
            if(value != null && value == true){
              _todoBloc.add(FetchTodoList(userId: BlocProvider.of<AppBloc>(context).state.userDetail?.userId??""));
            }
          });
        },
      ),
      body: BlocProvider(
        create: (BuildContext context) => _todoBloc,
        child: BlocConsumer<TodoBloc,TodoState>(
          listener: _handleState,
          builder: (context,state){
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MountainWithDetailsWidget(state.todoList),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(AppStrings.inbox.toUpperCase(),style: AppTextStyles.of(context).text14w700(Colors.grey),),
                ),
                state.todoList !=null && state.todoList!.isNotEmpty
                    ? _showTodoList(state.todoList!)
                    : Center(
                      child: Padding(
                        padding: const EdgeInsets.all(50.0),
                        child: Text(AppStrings.noTodoAddOne.toUpperCase(),style: AppTextStyles.of(context).text14w700(Colors.grey),textAlign: TextAlign.center,),
                      ),
                    ),
              ],
            );
          },
        ),
      ),
    );
  }

  _showTodoList(List<TodoModel> todoList) {
    return Expanded(
      child: ListView.separated(
        padding: const EdgeInsets.all(20),
        itemBuilder: (context,index){
          return TodoCard(todoList[index]);
        },
        separatorBuilder: (context,index){return Divider();},
        itemCount: todoList.length,
        shrinkWrap: true,
      ),
    );
  }

  void _handleState(BuildContext context, TodoState state) {
    if(!state.isLoading && state.error != null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error??"")));
    }
  }
}
