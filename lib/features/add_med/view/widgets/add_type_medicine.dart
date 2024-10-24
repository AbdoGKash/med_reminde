import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:med_reminder/core/theming/colors.dart';
import 'package:med_reminder/features/add_med/logic/add_med_notifier.dart';

class AddTypeMedicine extends ConsumerStatefulWidget {
  const AddTypeMedicine({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AddTypeMedicineState createState() => _AddTypeMedicineState();
}

class _AddTypeMedicineState extends ConsumerState<AddTypeMedicine> {
  List<String> items = [
    '  Rivet',
    '  Injection',
    '  Syrup Medicine',
    '  Ointment',
  ];

  //List<String> typeMedicineItems = [];

  String? selectedItem;

  @override
  Widget build(BuildContext context) {
    final typeMedicine = ref.watch(addMedProvider).typeMedicineItems;
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
                '  Select an Type Medicine',
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
                if (newValue != null && !typeMedicine.contains(newValue)) {
                  ref.read(addMedProvider.notifier).updateTypeMedicineItems([
                    ...typeMedicine,
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
            children: typeMedicine.map((item) {
              return Chip(
                label: Text(item),
                deleteIcon: Icon(Icons.cancel, color: ColorsManager.red),
                onDeleted: () {
                  ref.read(addMedProvider.notifier).updateTypeMedicineItems(
                        typeMedicine.where((i) => i != item).toList(),
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
