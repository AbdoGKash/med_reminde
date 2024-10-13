import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:med_reminder/core/theming/colors.dart';
import 'package:med_reminder/core/theming/text_styel.dart';
import 'package:med_reminder/features/add_med/view/widgets/add_schedule.dart';
import 'package:med_reminder/features/home/view/widgets/build_form_field.dart';

class AddMedicine extends StatelessWidget {
  AddMedicine({super.key});
  String? field1, field2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Medicine',
          style: TextStyles.font24WhiteBold,
        ),
        centerTitle: true,
        backgroundColor: ColorsManager.primary,
        iconTheme: const IconThemeData(
          color: Colors.white, // لتغيير لون أيقونة زر الرجوع
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(6.0).dg,
          child: SingleChildScrollView(
            child: Column(
              children: [
                buildTextFormField('Medicine Name', (value) => field1 = value),
                buildTextFormField('Frequency', (value) => field2 = value),
                const AddSchedule()
              ],
            ),
          )),
    );
  }
}
