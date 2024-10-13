// // import 'package:flutter/material.dart';
// // import 'package:flutter_riverpod/flutter_riverpod.dart';
// // import 'package:med_reminder/features/home/logic/reverpod.dart';

// // class ItemListPage extends ConsumerStatefulWidget {
// //   @override
// //   _ItemListPageState createState() => _ItemListPageState();
// // }

// // class _ItemListPageState extends ConsumerState<ItemListPage> {
// //   bool _isLoading = false; // حالة التحميل

// //   @override
// //   Widget build(BuildContext context) {
// //     final items = ref.watch(itemProvider);

// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Items List'),
// //       ),
// //       body: _isLoading
// //           ? Center(child: CircularProgressIndicator()) // دائرة التحميل
// //           : items.isEmpty
// //               ? Center(child: Text('No items available.'))
// //               : ListView.builder(
// //                   itemCount: items.length,
// //                   itemBuilder: (context, index) {
// //                     final item = items[index];
// //                     return ListTile(
// //                       title: Text(item.name),
// //                       subtitle: Text(item.description),
// //                       trailing: Row(
// //                         mainAxisSize: MainAxisSize.min,
// //                         children: [
// //                           IconButton(
// //                             icon: Icon(Icons.edit),
// //                             onPressed: () {
// //                               _showEditItemDialog(context, ref, item);
// //                             },
// //                           ),
// //                           IconButton(
// //                             icon: Icon(Icons.delete),
// //                             onPressed: () {
// //                               _deleteItem(item.id!); // حذف العنصر
// //                             },
// //                           ),
// //                         ],
// //                       ),
// //                     );
// //                   },
// //                 ),
// //       floatingActionButton: FloatingActionButton(
// //         onPressed: () {
// //           _showAddItemDialog(context, ref);
// //         },
// //         child: Icon(Icons.add),
// //       ),
// //     );
// //   }

// //   Future<void> _addItem(String name, String description) async {
// //     setState(() {
// //       _isLoading = true; // بدء التحميل
// //     });

// //     await ref.read(itemProvider.notifier).addItem(name, description);

// //     setState(() {
// //       _isLoading = false; // إنهاء التحميل
// //     });
// //   }

// //   Future<void> _deleteItem(int id) async {
// //     setState(() {
// //       _isLoading = true; // بدء التحميل
// //     });

// //     await ref.read(itemProvider.notifier).deleteItem(id);

// //     setState(() {
// //       _isLoading = false; // إنهاء التحميل
// //     });
// //   }

// //   void _showAddItemDialog(BuildContext context, WidgetRef ref) {
// //     final nameController = TextEditingController();
// //     final descriptionController = TextEditingController();

// //     showDialog(
// //       context: context,
// //       builder: (context) {
// //         return AlertDialog(
// //           title: Text('Add Item'),
// //           content: Column(
// //             mainAxisSize: MainAxisSize.min,
// //             children: [
// //               TextField(
// //                 controller: nameController,
// //                 decoration: InputDecoration(labelText: 'Name'),
// //               ),
// //               TextField(
// //                 controller: descriptionController,
// //                 decoration: InputDecoration(labelText: 'Description'),
// //               ),
// //             ],
// //           ),
// //           actions: [
// //             TextButton(
// //               onPressed: () {
// //                 Navigator.of(context).pop();
// //               },
// //               child: Text('Cancel'),
// //             ),
// //             ElevatedButton(
// //               onPressed: () {
// //                 _addItem(nameController.text, descriptionController.text);
// //                 Navigator.of(context).pop();
// //               },
// //               child: Text('Add'),
// //             ),
// //           ],
// //         );
// //       },
// //     );
// //   }

// //   void _showEditItemDialog(BuildContext context, WidgetRef ref, Item item) {
// //     final nameController = TextEditingController(text: item.name);
// //     final descriptionController = TextEditingController(text: item.description);

// //     showDialog(
// //       context: context,
// //       builder: (context) {
// //         return AlertDialog(
// //           title: Text('Edit Item'),
// //           content: Column(
// //             mainAxisSize: MainAxisSize.min,
// //             children: [
// //               TextField(
// //                 controller: nameController,
// //                 decoration: InputDecoration(labelText: 'Name'),
// //               ),
// //               TextField(
// //                 controller: descriptionController,
// //                 decoration: InputDecoration(labelText: 'Description'),
// //               ),
// //             ],
// //           ),
// //           actions: [
// //             TextButton(
// //               onPressed: () {
// //                 Navigator.of(context).pop();
// //               },
// //               child: Text('Cancel'),
// //             ),
// //             ElevatedButton(
// //               onPressed: () {
// //                 _updateItem(
// //                     item.id!, nameController.text, descriptionController.text);
// //                 Navigator.of(context).pop();
// //               },
// //               child: Text('Update'),
// //             ),
// //           ],
// //         );
// //       },
// //     );
// //   }

// //   Future<void> _updateItem(int id, String name, String description) async {
// //     setState(() {
// //       _isLoading = true; // بدء التحميل
// //     });

// //     await ref.read(itemProvider.notifier).updateItem(id, name, description);

// //     setState(() {
// //       _isLoading = false; // إنهاء التحميل
// //     });
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:med_reminder/features/home/logic/reverpod.dart';

// class ItemListPage extends ConsumerWidget {
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final itemState = ref.watch(itemProvider);

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Items List'),
//       ),
//       body: itemState.isLoading // إذا كانت حالة التحميل فعالة
//           ? Center(child: CircularProgressIndicator()) // دائرة تحميل
//           : itemState.items.isEmpty // إذا كانت قائمة العناصر فارغة
//               ? Center(child: Text('No items available.'))
//               : ListView.builder(
//                   itemCount: itemState.items.length,
//                   itemBuilder: (context, index) {
//                     final item = itemState.items[index];
//                     return ListTile(
//                       title: Text(item.name),
//                       subtitle: Text(item.description),
//                       trailing: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           IconButton(
//                             icon: Icon(Icons.edit),
//                             onPressed: () {
//                               _showEditItemDialog(context, ref, item);
//                             },
//                           ),
//                           IconButton(
//                             icon: Icon(Icons.delete),
//                             onPressed: () {
//                               ref
//                                   .read(itemProvider.notifier)
//                                   .deleteItem(item.id!);
//                             },
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                 ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           _showAddItemDialog(context, ref);
//         },
//         child: Icon(Icons.add),
//       ),
//     );
//   }

//   void _showAddItemDialog(BuildContext context, WidgetRef ref) {
//     final nameController = TextEditingController();
//     final descriptionController = TextEditingController();

//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Add Item'),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               TextField(
//                 controller: nameController,
//                 decoration: InputDecoration(labelText: 'Name'),
//               ),
//               TextField(
//                 controller: descriptionController,
//                 decoration: InputDecoration(labelText: 'Description'),
//               ),
//             ],
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text('Cancel'),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 ref.read(itemProvider.notifier).addItem(
//                       nameController.text,
//                       descriptionController.text,
//                     );
//                 Navigator.of(context).pop();
//               },
//               child: Text('Add'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   void _showEditItemDialog(BuildContext context, WidgetRef ref, Item item) {
//     final nameController = TextEditingController(text: item.name);
//     final descriptionController = TextEditingController(text: item.description);

//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Edit Item'),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               TextField(
//                 controller: nameController,
//                 decoration: InputDecoration(labelText: 'Name'),
//               ),
//               TextField(
//                 controller: descriptionController,
//                 decoration: InputDecoration(labelText: 'Description'),
//               ),
//             ],
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text('Cancel'),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 ref.read(itemProvider.notifier).updateItem(
//                       item.id!,
//                       nameController.text,
//                       descriptionController.text,
//                     );
//                 Navigator.of(context).pop();
//               },
//               child: Text('Update'),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:med_reminder/features/home/logic/reverpod.dart';

// class MedicineListPage extends ConsumerWidget {
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final medicineState = ref.watch(medicineProvider);

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Medicine Reminder'),
//       ),
//       body: medicineState.isLoading // حالة التحميل
//           ? Center(child: CircularProgressIndicator()) // دائرة تحميل
//           : medicineState.medicines.isEmpty // إذا كانت قائمة الأدوية فارغة
//               ? Center(child: Text('No medicines available.'))
//               : ListView.builder(
//                   itemCount: medicineState.medicines.length,
//                   itemBuilder: (context, index) {
//                     final medicine = medicineState.medicines[index];
//                     return ListTile(
//                       title: Text(medicine.name),
//                       subtitle: Text(
//                           'Dosage: ${medicine.dosage}, Time: ${medicine.time}'),
//                       trailing: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           IconButton(
//                             icon: Icon(Icons.edit),
//                             onPressed: () {
//                               _showEditMedicineDialog(context, ref, medicine);
//                             },
//                           ),
//                           IconButton(
//                             icon: Icon(Icons.delete),
//                             onPressed: () {
//                               ref
//                                   .read(medicineProvider.notifier)
//                                   .deleteMedicine(medicine.id!);
//                             },
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                 ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           _showAddMedicineDialog(context, ref);
//         },
//         child: Icon(Icons.add),
//       ),
//     );
//   }

//   void _showAddMedicineDialog(BuildContext context, WidgetRef ref) {
//     final nameController = TextEditingController();
//     final dosageController = TextEditingController();
//     final timeController = TextEditingController();

//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Add Medicine'),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               TextField(
//                 controller: nameController,
//                 decoration: InputDecoration(labelText: 'Medicine Name'),
//               ),
//               TextField(
//                 controller: dosageController,
//                 decoration: InputDecoration(labelText: 'Dosage'),
//               ),
//               TextField(
//                 controller: timeController,
//                 decoration: InputDecoration(labelText: 'Time'),
//               ),
//             ],
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text('Cancel'),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 ref.read(medicineProvider.notifier).addMedicine(
//                       nameController.text,
//                       dosageController.text,
//                       timeController.text,
//                     );
//                 Navigator.of(context).pop();
//               },
//               child: Text('Add'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   void _showEditMedicineDialog(
//       BuildContext context, WidgetRef ref, Medicine medicine) {
//     final nameController = TextEditingController(text: medicine.name);
//     final dosageController = TextEditingController(text: medicine.dosage);
//     final timeController = TextEditingController(text: medicine.time);

//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Edit Medicine'),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               TextField(
//                 controller: nameController,
//                 decoration: InputDecoration(labelText: 'Medicine Name'),
//               ),
//               TextField(
//                 controller: dosageController,
//                 decoration: InputDecoration(labelText: 'Dosage'),
//               ),
//               TextField(
//                 controller: timeController,
//                 decoration: InputDecoration(labelText: 'Time'),
//               ),
//             ],
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text('Cancel'),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 ref.read(medicineProvider.notifier).updateMedicine(
//                       medicine.id!,
//                       nameController.text,
//                       dosageController.text,
//                       timeController.text,
//                     );
//                 Navigator.of(context).pop();
//               },
//               child: Text('Save'),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
