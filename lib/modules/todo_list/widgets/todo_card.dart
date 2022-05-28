import 'package:firebase_todo_app/modules/todo_list/models/todo_model.dart';
import 'package:firebase_todo_app/utils/app_colors.dart';
import 'package:firebase_todo_app/utils/app_text_style.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
  final TodoModel todoItem;

  const TodoCard(this.todoItem, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 50,
          height: 50,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(30)),
              border: Border.all(color: Colors.grey.withOpacity(0.5), width: 1)),
          child: Image.asset(
            todoItem.todoType == 1 ? 'assets/paint_tool.png' : 'assets/tie.png',
            color: AppColors.color0xFF3465CD,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(todoItem.message??"",style: AppTextStyles.of(context).text16w700(AppColors.color0xFF000000)),
              Text(todoItem.place??"",style: AppTextStyles.of(context).text14w500(Colors.grey)),
            ],
          ),
        ),
        const SizedBox(width: 5),
        Text(DateFormat("hha").format(DateTime.parse(todoItem.time??"").toLocal()),style: AppTextStyles.of(context).text12w700(Colors.grey)),
      ],
    );
  }
}
