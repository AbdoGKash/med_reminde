import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:med_reminder/core/theming/colors.dart';

Widget buildCustomButton(String buttonText, VoidCallback onPressed) {
  return SizedBox(
    width: 370.w, // عرض الزر يكون نفس عرض TextFormField
    height: 50.h, // ارتفاع الزر
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorsManager.primary, // لون خلفية الزر
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // الحواف المستديرة
        ),
      ),
      onPressed: onPressed,
      child: Text(
        buttonText,
        style: TextStyle(
          color: ColorsManager.white, // لون النص
          fontSize: 16.sp, // حجم النص
        ),
      ),
    ),
  );
}
