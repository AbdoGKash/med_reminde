// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:med_reminder/core/routing/app_router.dart';
// import 'package:med_reminder/core/routing/routers_name.dart';
// import 'package:med_reminder/core/theming/colors.dart';
// import 'package:med_reminder/core/theming/text_styel.dart';
// import 'package:med_reminder/features/home/view/widgets/medicine_card.dart';
// import 'package:med_reminder/features/home/view/widgets/open_dialog.dart';

// // ignore: must_be_immutable
// class Home extends StatelessWidget {
//   const Home({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Home',
//           style: TextStyles.font24WhiteBold,
//         ),
//         centerTitle: true,
//         backgroundColor: ColorsManager.primary,
//       ),
//       body: Padding(
//           padding: const EdgeInsets.all(6.0).dg,
//           child: const SingleChildScrollView(
//             child: Column(
//               children: [
//                 MedicineCard(),
//                 MedicineCard(),
//                 MedicineCard(),
//                 MedicineCard()
//               ],
//             ),
//           )),
//       floatingActionButton: FloatingActionButton(
//           backgroundColor: ColorsManager.primary,
//           child: const Icon(Icons.add),
//           onPressed: () {
//             Navigator.of(context).pushNamed(RoutersName.addMed);
//           }),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart'; // لتنسيق الوقت
import 'package:med_reminder/features/home/data/med_model/medicine.dart';
import 'package:med_reminder/features/home/logic/riverpod.dart';

class HomePage extends ConsumerWidget {
  HomePage({Key? key}) : super(key: key);

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();
  final TextEditingController _frequencyController = TextEditingController();
  final TextEditingController _scheduleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  DateTime? _selectedTime;

  // دالة لعرض مربع حوار لإضافة أو تعديل دواء
  Future<void> _showMedicineDialog(BuildContext context, WidgetRef ref,
      {Medicine? medicine}) async {
    if (medicine != null) {
      _nameController.text = medicine.name;
      _typeController.text = medicine.typeMedicine;
      _frequencyController.text = medicine.frequency;
      _scheduleController.text = medicine.schedule;
      _noteController.text = medicine.note;
      _selectedTime = medicine.time;
    } else {
      _nameController.clear();
      _typeController.clear();
      _frequencyController.clear();
      _scheduleController.clear();
      _noteController.clear();
      _selectedTime = null;
    }

    await showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text(medicine == null ? 'Add Medicine' : 'Edit Medicine'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: 'Medicine Name'),
                ),
                TextField(
                  controller: _typeController,
                  decoration: InputDecoration(labelText: 'Type of Medicine'),
                ),
                TextField(
                  controller: _frequencyController,
                  decoration: InputDecoration(labelText: 'Frequency'),
                ),
                TextField(
                  controller: _scheduleController,
                  decoration: InputDecoration(labelText: 'Schedule'),
                ),
                TextField(
                  controller: _noteController,
                  decoration: InputDecoration(labelText: 'Note'),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () async {
                    final selectedTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (selectedTime != null) {
                      _selectedTime = DateTime(
                        DateTime.now().year,
                        DateTime.now().month,
                        DateTime.now().day,
                        selectedTime.hour,
                        selectedTime.minute,
                      );
                    }
                  },
                  child: Text('Select Time'),
                ),
                if (_selectedTime != null)
                  Text(
                      'Selected Time: ${DateFormat('hh:mm a').format(_selectedTime!)}'),
              ],
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (medicine == null) {
                  // إضافة دواء جديد
                  ref.read(medicineProvider.notifier).addMedicine(
                        Medicine(
                          id: null,
                          name: _nameController.text,
                          typeMedicine: _typeController.text,
                          frequency: _frequencyController.text,
                          schedule: _scheduleController.text,
                          time: _selectedTime ?? DateTime.now(),
                          note: _noteController.text,
                        ),
                      );
                } else {
                  // تحديث الدواء
                  ref.read(medicineProvider.notifier).updateMedicine(
                        Medicine(
                          id: medicine.id,
                          name: _nameController.text,
                          typeMedicine: _typeController.text,
                          frequency: _frequencyController.text,
                          schedule: _scheduleController.text,
                          time: _selectedTime ?? DateTime.now(),
                          note: _noteController.text,
                        ),
                      );
                }

                Navigator.of(context).pop();
              },
              child: Text(medicine == null ? 'Add' : 'Update'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final medicineState = ref.watch(medicineProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Medicine Manager'),
      ),
      body: medicineState.isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: medicineState.medicines.length,
              itemBuilder: (context, index) {
                final medicine = medicineState.medicines[index];
                return ListTile(
                  title: Text(medicine.name),
                  subtitle: Text(
                      'Type: ${medicine.typeMedicine} | Time: ${DateFormat('hh:mm a').format(medicine.time)}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          _showMedicineDialog(context, ref, medicine: medicine);
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          ref
                              .read(medicineProvider.notifier)
                              .deleteMedicine(medicine.id!);
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showMedicineDialog(context, ref);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
