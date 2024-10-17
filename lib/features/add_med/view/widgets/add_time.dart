import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:med_reminder/core/theming/colors.dart';

class AddTime extends StatefulWidget {
  const AddTime({super.key});

  @override
  _AddTimeState createState() => _AddTimeState();
}

class _AddTimeState extends State<AddTime> {
  List<TimeOfDay> selectedTimes = [];

  TimeOfDay? selectedTime;

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
        if (!selectedTimes.contains(picked)) {
          selectedTimes.add(picked); // إضافة الوقت المختار إلى القائمة
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 70.h,
            width: 370.w,
            decoration: BoxDecoration(
              color: ColorsManager.primary2,
              border: Border.all(
                color: const Color(0xFF82B1FF),
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: InkWell(
              onTap: () => _selectTime(context), // اختيار الوقت
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      selectedTime == null
                          ? '  Select a Time'
                          : '  ${selectedTime!.format(context)}',
                      style: TextStyle(color: ColorsManager.primary),
                    ),
                    Icon(
                      Icons.access_time,
                      color: ColorsManager.primary,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20.h),
          Wrap(
            spacing: 8.0,
            children: selectedTimes.map((time) {
              return Chip(
                label: Text(time.format(context)),
                deleteIcon: Icon(Icons.cancel, color: ColorsManager.red),
                onDeleted: () {
                  setState(() {
                    selectedTimes
                        .remove(time); // حذف الوقت عند الضغط على الأيقونة
                  });
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
