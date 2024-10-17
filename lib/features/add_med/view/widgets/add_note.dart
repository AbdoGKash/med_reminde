import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:med_reminder/core/theming/colors.dart';

Widget buildMultilineTextFormField(
    String labelText, Function(String?) onSaved) {
  return Padding(
    padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
    child: SizedBox(
      height: 200.h, // تعديل الارتفاع ليتناسب مع النصوص المتعددة
      width: 370.w,
      child: TextFormField(
        keyboardType: TextInputType.multiline, // لتمكين الكتابة المتعددة الأسطر
        maxLines: null, // للسماح بعدد غير محدود من الأسطر
        minLines: 5, // تحديد الحد الأدنى لعدد الأسطر
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
