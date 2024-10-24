import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:med_reminder/core/theming/colors.dart';
import 'package:med_reminder/features/add_med/logic/add_med_notifier.dart';

class CustomTextFormField extends ConsumerWidget {
  const CustomTextFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final addMedNotifier = ref.read(addMedProvider.notifier);
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0).dg,
      child: SizedBox(
        height: 70.h,
        width: 370.w,
        child: TextFormField(
          controller: addMedNotifier.nameTextController,
          decoration: InputDecoration(
            labelText: 'Medicine Name',
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
          onChanged: (newText) {
            addMedNotifier.updateNameText(); // تحديث القيمة عند التغيير
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
          // onSaved: onSaved,
        ),
      ),
    );
  }
}
