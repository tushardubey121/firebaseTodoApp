import 'package:firebase_todo_app/utils/app_colors.dart';
import 'package:firebase_todo_app/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class SelectInput extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final TextStyle? textStyle;
  final TextStyle? hintTextStyle;
  final TextInputAction? textInputAction;
  final void Function(SelectItem?)? onFieldSubmitted;
  final FocusNode? focusNode;
  final List<SelectItem> items;
  final SelectItem? value;

  const SelectInput({
    Key? key,
    this.controller,
    this.hintText,
    this.hintTextStyle,
    this.textStyle,
    this.textInputAction,
    this.onFieldSubmitted,
    this.focusNode,
    required this.items,
    this.value,
  }) : super(key: key);

  @override
  _SelectInputState createState() => _SelectInputState();
}

class _SelectInputState extends State<SelectInput> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      items: widget.items
          .map((item) => DropdownMenuItem(
                child: Text(
                  item.label,
                  style: widget.textStyle ?? AppTextStyles.of(context).text18w400(AppColors.color0xFF000000),
                ),
                value: item.value,
              ))
          .toList(),
      onChanged: (value) {
        var selectedElement = widget.items.firstWhere((element) => element.value == value);
        widget.onFieldSubmitted?.call(selectedElement);
        widget.controller?.text = selectedElement.label;
      },
      decoration: InputDecoration(border: InputBorder.none, hintText: widget.hintText, hintStyle: widget.hintTextStyle ?? AppTextStyles.of(context).text18w400(AppColors.color0xFFFFFFFF), contentPadding: EdgeInsets.zero),
      icon: const Icon(Icons.keyboard_arrow_down_rounded,color: AppColors.color0xFFFFFFFF,),
      dropdownColor: AppColors.color0xFF3465CD,
      value: widget.value?.value,
      focusNode: widget.focusNode,
      isDense: false,
    );
  }
}

class SelectItem<T> {
  final String label;
  final T value;

  SelectItem(this.label, this.value);
}
