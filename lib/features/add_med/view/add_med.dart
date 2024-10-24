import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:med_reminder/core/theming/colors.dart';
import 'package:med_reminder/core/theming/text_styel.dart';
import 'package:med_reminder/features/add_med/logic/add_med_notifier.dart';
import 'package:med_reminder/features/add_med/view/widgets/add_frequency.dart';
import 'package:med_reminder/features/add_med/view/widgets/add_note.dart';
import 'package:med_reminder/features/add_med/view/widgets/add_schedule.dart';
import 'package:med_reminder/features/add_med/view/widgets/add_time.dart';
import 'package:med_reminder/features/add_med/view/widgets/add_type_medicine.dart';
import 'package:med_reminder/features/add_med/view/widgets/added_button.dart';
import 'package:med_reminder/features/add_med/view/widgets/build_form_field.dart';

class AddMedicine extends ConsumerWidget {
  AddMedicine({super.key});
  String? field1, field2;
  TextEditingController nameController = TextEditingController();
  String formatTime(TimeOfDay time) {
    return time.hour.toString().padLeft(2, '0') +
        ':' +
        time.minute.toString().padLeft(2, '0');
  }

  void add(WidgetRef ref) {
    final frequencyItems = ref.watch(addMedProvider).frequencyItems;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final frequencyItems = ref.watch(addMedProvider).frequencyItems;

    // final scheduleItems = ref.watch(addMedProvider).scheduleItems;

    // final typeMedicineItems = ref.watch(addMedProvider).typeMedicineItems;

    // final noteText = ref.watch(addMedProvider).noteText;
    // final nameText = ref.watch(addMedProvider).nameText;
    // final selectedTimes = ref.watch(addMedProvider).selectedTimes;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Medicine',
          style: TextStyles.font24WhiteBold,
        ),
        centerTitle: true,
        backgroundColor: ColorsManager.primary,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(6.0).dg,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const CustomTextFormField(),
                const AddTypeMedicine(),
                const AddFrequency(),
                const AddSchedule(),
                const AddTime(),
                const MultilineTextFormField(),
                CustomButton(
                    buttonText: 'Add Medicine',
                    onPressed: () {
                      // print(nameText);
                      // print(noteText);
                      // print(formatTime(selectedTimes[0]));
                      // print(frequencyItems);
                      // print(scheduleItems);
                      // print(typeMedicineItems);
                    }),
              ],
            ),
          )),
    );
  }
}
