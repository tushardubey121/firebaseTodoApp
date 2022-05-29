import 'dart:developer';

import 'package:firebase_todo_app/modules/add_todo/bloc/add_todo_bloc.dart';
import 'package:firebase_todo_app/modules/add_todo/bloc/add_todo_event.dart';
import 'package:firebase_todo_app/modules/add_todo/bloc/add_todo_state.dart';
import 'package:firebase_todo_app/modules/add_todo/models/add_todo_request.dart';
import 'package:firebase_todo_app/modules/add_todo/widgets/select_input.dart';
import 'package:firebase_todo_app/modules/add_todo/widgets/text_input.dart';
import 'package:firebase_todo_app/modules/authentication/bloc/app_bloc.dart';
import 'package:firebase_todo_app/utils/app_colors.dart';
import 'package:firebase_todo_app/utils/app_strings.dart';
import 'package:firebase_todo_app/utils/app_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class AddTodoPage extends StatefulWidget {
  static String route() => 'AddTodoPage';

  const AddTodoPage({Key? key}) : super(key: key);

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  final List<SelectItem> _todoType = [
    SelectItem('Personal', 1),
    SelectItem('Business', 2),
  ];
  final TextEditingController _todoTypeController = TextEditingController();
  final TextEditingController _message = TextEditingController();
  final TextEditingController _place = TextEditingController();
  final TextEditingController _time = TextEditingController();
  final TextEditingController _notification = TextEditingController();
  SelectItem? _selectedTodoType;

  late AddTodoBloc _addTodoBloc;

  @override
  void initState() {
    _addTodoBloc = AddTodoBloc();
    super.initState();
  }

  @override
  void dispose() {
    _addTodoBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppColors.color0xFF3465CD,
        elevation: 0,
        leading: InkWell(
          child: const Icon(Icons.arrow_back, color: AppColors.color0xFF54BCFC),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text(
          AppStrings.addNewThings,
          style:
              AppTextStyles.of(context).text18w400(AppColors.color0xFFFFFFFF),
        ),
      ),
      body: BlocProvider(
        create: (BuildContext context) => _addTodoBloc,
        child: BlocConsumer<AddTodoBloc,AddTodoState>(
          listener: _handleState,
          builder: (BuildContext context, AddTodoState? state) {
            if(state!.isLoading){
              return Container(
                width: double.maxFinite,
                height: double.maxFinite,
                alignment: Alignment.center,
                color: AppColors.color0xFF3465CD,
                child: const CupertinoActivityIndicator(
                  color: AppColors.color0xFFFFFFFF,
                  radius: 20,
                ),
              );
            }
            return Container(
              padding: const EdgeInsets.all(20.0),
              color: AppColors.color0xFF3465CD,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _paintIcon(),
                  _dropdown(),
                  TextInput(
                    controller: _message,
                    hintText: AppStrings.message,
                  ),
                  TextInput(
                    controller: _place,
                    hintText: AppStrings.place,
                  ),
                  TextInput(
                    controller: _time,
                    hintText: AppStrings.time,
                    onTap: (){
                      DatePicker.showDateTimePicker(context,
                        showTitleActions: true,
                        minTime: DateTime.now(),
                        maxTime: DateTime.now().add(const Duration(days: 365)),
                        theme: DatePickerTheme(
                          backgroundColor: Colors.white70,
                          doneStyle: AppTextStyles.of(context).text14w700(AppColors.color0xFF3465CD),
                          cancelStyle: AppTextStyles.of(context).text14w700(Colors.grey),
                          headerColor: AppColors.color0xFFFFFFFF,
                        ),
                        onChanged: (date) {
                          log('change $date');
                        },
                        onConfirm: (date) {
                          log('confirm $date');
                          _time.text = date.toLocal().toString().split('.').first;
                        },
                        currentTime: DateTime.now(), locale: LocaleType.en,
                      );
                    },
                  ),
                  TextInput(
                    controller: _notification,
                    hintText: AppStrings.notification,
                  ),
                  _button()
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  _paintIcon() {
    return Container(
      width: 45,
      height: 45,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          border: Border.all(color: Colors.white60, width: 1)),
      child: Image.asset(
        'assets/paint_tool.png',
        color: Colors.white60,
      ),
    );
  }

  _dropdown() {
    return SelectInput(
      controller: _todoTypeController,
      hintText: AppStrings.selectTodoType,
      textInputAction: TextInputAction.done,
      textStyle:
          AppTextStyles.of(context).text16w400(AppColors.color0xFFFFFFFF),
      hintTextStyle: AppTextStyles.of(context).text16w400(Colors.white54),
      items: List.generate(_todoType.length,
          (index) => SelectItem(_todoType[index].label, _todoType[index])),
      onFieldSubmitted: (selectedItem) {
        _selectedTodoType = selectedItem;
      },
      value: _selectedTodoType,
    );
  }

  _button() {
    return InkWell(
      onTap: (){
        if(_selectedTodoType == null){
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text(AppStrings.selectTodoType)));
        } else if(_message.text.trim().isEmpty){
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text(AppStrings.addMessage)));
        } else if(_place.text.trim().isEmpty){
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text(AppStrings.addPlace)));
        } else if(_time.text.trim().isEmpty){
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text(AppStrings.addTime)));
        }else{
          _addTodoBloc.add(
              AddTodo(request: AddTodoRequest(
                createdBy: BlocProvider.of<AppBloc>(context).state.userDetail?.userId??"",
                message: _message.text.trim(),
                place: _place.text.trim(),
                time: _time.text.trim(),
                todoType: _selectedTodoType?.value?.value,
                notification: _notification.text.trim(),
              ))
          );
        }
      },
      child: Container(
        height: 50,
        width: double.maxFinite,
        margin: const EdgeInsets.only(top: 20),
        decoration: const BoxDecoration(
          color: AppColors.color0xFF54BCFC,
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        alignment: Alignment.center,
        child: Text(
          AppStrings.addYourThing.toUpperCase(),
          style: AppTextStyles.of(context).text16w700(AppColors.color0xFFFFFFFF),
        ),
      ),
    );
  }

  void _handleState(BuildContext context, AddTodoState state) {
    if(state.isSuccess){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text(AppStrings.todoAddSuccess)));
      Navigator.pop(context,true);
    }else {
      if(!state.isLoading) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error??"")));
      }
    }
  }
}
