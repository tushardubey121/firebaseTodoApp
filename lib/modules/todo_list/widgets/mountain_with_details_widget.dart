import 'package:firebase_todo_app/modules/todo_list/models/todo_model.dart';
import 'package:firebase_todo_app/utils/app_colors.dart';
import 'package:firebase_todo_app/utils/app_images.dart';
import 'package:firebase_todo_app/utils/app_strings.dart';
import 'package:firebase_todo_app/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class MountainWithDetailsWidget extends StatelessWidget {

  MountainWithDetailsWidget(this.todoList, {Key? key}) : super(key: key);

  final List<TodoModel>? todoList;

  final DateTime _dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: MediaQuery.of(context).size.height * 0.35,
      child: Stack(
        children: [
          Image.asset(
            AppImages.mountain,
            fit: BoxFit.cover,
            width: double.maxFinite,
            height: MediaQuery.of(context).size.height * 0.35,
          ),
          Row(
            children: [
              Expanded(
                flex: 10,
                child: Container(
                  color: AppColors.color0xFF3465CD.withOpacity(0.4),
                  padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(Icons.menu,color: AppColors.color0xFFFFFFFF,),
                      Text(AppStrings.yourThings,style: AppTextStyles.of(context).text40w400(AppColors.color0xFFFFFFFF)),
                      Text('${_month(_dateTime.month)} ${_dateTime.day}, ${_dateTime.year}',style: AppTextStyles.of(context).text12w400(Colors.grey)),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 7,
                child: Container(
                  color: AppColors.color0xFF3465CD.withOpacity(0.5),
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(_getPersonalCount(),style: AppTextStyles.of(context).text25w500(AppColors.color0xFFFFFFFF)),
                            Text(AppStrings.personal,style: AppTextStyles.of(context).text12w400(Colors.white60)),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(_getBusinessCount(),style: AppTextStyles.of(context).text25w500(AppColors.color0xFFFFFFFF)),
                            Text(AppStrings.business,style: AppTextStyles.of(context).text12w400(Colors.white60)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _month(int month) {
    switch(month){
      case 1: return 'Jan';
      case 2: return 'Feb';
      case 3: return 'Mar';
      case 4: return 'Apr';
      case 5: return 'May';
      case 6: return 'June';
      case 7: return 'July';
      case 8: return 'Aug';
      case 9: return 'Sep';
      case 10: return 'Oct';
      case 11: return 'Nov';
      case 12: return 'Dec';
    }
  }

  String _getPersonalCount() {
    if(todoList == null){
      return '0';
    } else if( todoList!.isEmpty){
      return '0';
    } else {
      var list  = todoList!.where((element) => element.todoType == 1);
      return '${list.length}';
    }
  }

  String _getBusinessCount() {
    if(todoList == null){
      return '0';
    } else if( todoList!.isEmpty){
      return '0';
    } else {
      var list  = todoList!.where((element) => element.todoType == 2);
      return '${list.length}';
    }
  }
}
