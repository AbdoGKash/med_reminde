import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:med_reminder/core/theming/colors.dart';
import '../../logic/add_med_notifier.dart';

class AddFrequency extends ConsumerStatefulWidget {
  const AddFrequency({super.key});

  @override
  _AddFrequencyState createState() => _AddFrequencyState();
}

class _AddFrequencyState extends ConsumerState<AddFrequency> {
  // قائمة الخيارات في Dropdown
  List<String> items = [
    'Every day',
    'Every two days',
    'Every three days',
    'Weekly',
    'Every ten days',
    'Every fifteen days',
    'Monthly'
  ];

  // متغير لتخزين العنصر المحدد
  String? selectedItem;

  @override
  Widget build(BuildContext context) {
    // استدعاء الحالة الحالية من provider
    final frequencyItems = ref.watch(addMedProvider).frequencyItems;

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
            child: DropdownButton<String>(
              dropdownColor: ColorsManager.white,
              hint: Text(
                'Select a Frequency',
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
                if (newValue != null && !frequencyItems.contains(newValue)) {
                  ref.read(addMedProvider.notifier).updateFrequency([
                    ...frequencyItems,
                    newValue
                  ]); // add newValue to frequencyItems
                }
                selectedItem = newValue;
                // setState(() {
                //   selectedItem = newValue;
                //   // إضافة العنصر إلى قائمة frequencyItems
                //   if (newValue != null && !frequencyItems.contains(newValue)) {
                //     ref.read(addMedProvider.notifier).updateFrequency([
                //       ...frequencyItems,
                //       newValue
                //     ]); // add newValue to frequencyItems
                //   }
                // });
              },
            ),
          ),
          SizedBox(height: 20.h),
          Wrap(
            spacing: 8.0,
            children: frequencyItems.map((item) {
              return Chip(
                label: Text(item),
                deleteIcon: Icon(Icons.cancel, color: ColorsManager.red),
                onDeleted: () {
                  // إزالة العنصر من قائمة frequencyItems
                  ref.read(addMedProvider.notifier).updateFrequency(
                        frequencyItems.where((i) => i != item).toList(),
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
