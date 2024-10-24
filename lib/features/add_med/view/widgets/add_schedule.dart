import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:med_reminder/core/theming/colors.dart';

import '../../logic/add_med_notifier.dart';

class AddSchedule extends ConsumerStatefulWidget {
  const AddSchedule({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AddScheduleState createState() => _AddScheduleState();
}

class _AddScheduleState extends ConsumerState<AddSchedule> {
  List<String> items = [
    '  after breakfast',
    '  after lunch',
    '  after dinner',
    '  before breakfast',
    '  before lunch',
    '  before dinner'
  ];

  // List<String> scheduleItems = [];

  String? selectedItem;

  @override
  Widget build(BuildContext context) {
    final scheduleItems = ref.watch(addMedProvider).scheduleItems;
    return Padding(
      padding: const EdgeInsets.all(6.0).dg,
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
            child: DropdownButton<String>(
              dropdownColor: ColorsManager.white,
              hint: Text(
                '  Select an Schedule',
                style: TextStyle(color: ColorsManager.primary),
              ),
              style: TextStyle(color: ColorsManager.primary),
              value: selectedItem,
              underline: Container(),
              isExpanded: true,
              icon: Icon(
                Icons.arrow_drop_down,
                color: ColorsManager.primary,
              ),
              items: items.map((String item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList(),
              onChanged: (String? newValue) {
                if (newValue != null && !scheduleItems.contains(newValue)) {
                  ref.read(addMedProvider.notifier).updateScheduleItems([
                    ...scheduleItems,
                    newValue
                  ]); // add newValue to frequencyItems
                }
                selectedItem = newValue;
              },
            ),
          ),
          SizedBox(height: 20.h),
          Wrap(
            spacing: 8.0,
            children: scheduleItems.map((item) {
              return Chip(
                label: Text(item),
                deleteIcon: Icon(Icons.cancel, color: ColorsManager.red),
                onDeleted: () {
                  ref.read(addMedProvider.notifier).updateScheduleItems(
                        scheduleItems.where((i) => i != item).toList(),
                      );
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
