import 'package:flutter/material.dart';

class AppTextStyles {
  final BuildContext context;

  AppTextStyles(this.context);

  static AppTextStyles of(BuildContext context) {
    return AppTextStyles(context);
  }

  TextStyle text50w700(Color color) => TextStyle(
    color: color,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
    fontSize: 50.0,
  );

  TextStyle text18w700(Color color) => TextStyle(
    color: color,
    fontSize: 18,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
  );

  TextStyle text25w500(Color color) => TextStyle(
    color: color,
    fontSize: 25,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
  );

  TextStyle text18w400(Color color) => TextStyle(
    color: color,
    fontSize: 18,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
  );

  TextStyle text16w700(Color color) => TextStyle(
    color: color,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
    fontSize: 16.0,
  );

  TextStyle text16w500(Color color) => TextStyle(
    color: color,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    fontSize: 16.0,
  );

  TextStyle text16w400(Color color) => TextStyle(
    color: color,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    fontSize: 16.0,
  );

  TextStyle text14w700(Color color) => TextStyle(
    color: color,
    fontSize: 14,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
  );

  TextStyle text14w500(Color color) => TextStyle(
    color: color,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
  );

  TextStyle text14w400(Color color) => TextStyle(
    color: color,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
  );

  TextStyle text12w700(Color color) => TextStyle(
    color: color,
    fontSize: 12,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
  );

  TextStyle text12w400(Color color) => TextStyle(
    color: color,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
  );

  TextStyle text40w400(Color color) => TextStyle(
    color: color,
    fontSize: 40,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
  );
}
