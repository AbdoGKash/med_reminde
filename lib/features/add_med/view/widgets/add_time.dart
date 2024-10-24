import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:med_reminder/core/theming/colors.dart';
import 'package:med_reminder/features/add_med/logic/add_med_notifier.dart';

// وسم AddTime لتحديث وإظهار الأوقات المحددة
class AddTime extends ConsumerWidget {
  const AddTime({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final addMedNotifier = ref.read(addMedProvider.notifier);
    List<TimeOfDay> selectedTimes = ref.watch(addMedProvider).selectedTimes;

    TimeOfDay? selectedTime;

    Future<void> _selectTime(BuildContext context) async {
      final TimeOfDay? picked = await showTimePicker(
        context: context,
        initialTime: selectedTime ?? TimeOfDay.now(),
      );
      if (picked != null && picked != selectedTime) {
        selectedTime = picked;
        if (!selectedTimes.contains(picked)) {
          addMedNotifier.updateSelectedTimes(
              [...selectedTimes, picked]); // إضافة الوقت للمزود
        }
      }
    }

    // دالة لتنسيق الوقت بشكل صحيح
    String formatTime(TimeOfDay time) {
      return time.hour.toString().padLeft(2, '0') +
          ':' +
          time.minute.toString().padLeft(2, '0');
    }

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
                          : '  ${formatTime(selectedTime!)}', // استخدم دالة التنسيق
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
                label: Text(formatTime(time)), // استخدم دالة التنسيق هنا أيضاً
                deleteIcon: Icon(Icons.cancel, color: ColorsManager.red),
                onDeleted: () {
                  addMedNotifier.updateSelectedTimes(selectedTimes
                      .where((t) => t != time)
                      .toList()); // حذف الوقت
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
