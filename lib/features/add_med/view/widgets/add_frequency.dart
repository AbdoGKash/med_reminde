import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:med_reminder/core/theming/colors.dart';

class AddFrequency extends StatefulWidget {
  const AddFrequency({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AddFrequencyState createState() => _AddFrequencyState();
}

class _AddFrequencyState extends State<AddFrequency> {
  List<String> items = [
    '  Every day',
    '  Every two days',
    '  Every three days',
    '  Weekly',
    '  Every ten days',
    '  Every fifteen days',
    '  Monthly'
  ];

  List<String> selectedItems = [];

  String? selectedItem;

  @override
  Widget build(BuildContext context) {
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
                '  Select an Frequency',
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
                setState(() {
                  selectedItem = newValue;
                  if (newValue != null && !selectedItems.contains(newValue)) {
                    selectedItems
                        .add(newValue); // إضافة العنصر المختار إلى القائمة
                  }
                });
              },
            ),
          ),
          SizedBox(height: 20.h),
          Wrap(
            spacing: 8.0,
            children: selectedItems.map((item) {
              return Chip(
                label: Text(item),
                deleteIcon: Icon(Icons.cancel, color: ColorsManager.red),
                onDeleted: () {
                  setState(() {
                    selectedItems
                        .remove(item); // حذف العنصر عند الضغط على الأيقونة
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
