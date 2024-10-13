import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:med_reminder/core/theming/colors.dart';

Widget buildTextFormField(String labelText, Function(String?) onSaved) {
  return Padding(
    padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
    child: SizedBox(
      height: 70.h,
      width: 370.w,
      child: TextFormField(
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(color: ColorsManager.primary),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorsManager.primary3),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorsManager.primary),
            borderRadius: BorderRadius.circular(10),
          ),
          filled: true,
          fillColor: ColorsManager.primary2, // لون الخلفية للحقل
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
        onSaved: onSaved,
      ),
    ),
  );
}
