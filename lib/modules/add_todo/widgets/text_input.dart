import 'package:firebase_todo_app/utils/app_colors.dart';
import 'package:firebase_todo_app/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class TextInput extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final TextInputAction? textInputAction;
  final void Function(String)? onFieldSubmitted;
  final void Function()? onTap;
  final FocusNode? focusNode;
  final int? maxLength;
  final bool enabled;

  const TextInput({
    Key? key,
    this.controller,
    this.hintText,
    this.textInputAction,
    this.onTap,
    this.onFieldSubmitted,
    this.focusNode,
    this.maxLength,
    this.enabled = true,
  }) : super(key: key);

  @override
  _TextInputState createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      controller: widget.controller,
      cursorColor: AppColors.color0xFFFFFFFF,
      cursorWidth: 4,
      readOnly: widget.onTap != null,
      onTap: () {
        if (widget.onTap != null) widget.onTap!();
      },
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: widget.hintText,
        hintStyle: AppTextStyles.of(context).text16w400(Colors.white54),
        counterText: "",
      ),
      style: AppTextStyles.of(context).text16w400(AppColors.color0xFFFFFFFF),
      textInputAction: widget.textInputAction,
      onFieldSubmitted: widget.onFieldSubmitted,
      focusNode: widget.focusNode,
      maxLength: widget.maxLength,
      enabled: widget.enabled,
    );
  }
}
