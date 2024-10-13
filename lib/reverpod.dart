// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:med_reminder/core/helper/database_helper.dart';

// // إنشاء نوع من البيانات (Item)
// class Item {
//   final int? id;
//   final String name;
//   final String description;

//   Item({this.id, required this.name, required this.description});
// }

// // إنشاء Provider
// class ItemNotifier extends StateNotifier<List<Item>> {
//   ItemNotifier() : super([]);

//   Future<void> fetchItems() async {
//     final itemsData = await DatabaseHelper().getItems();
//     state = itemsData
//         .map((item) => Item(
//             id: item['id'],
//             name: item['name'],
//             description: item['description']))
//         .toList();
//   }

//   Future<void> addItem(String name, String description) async {
//     await DatabaseHelper()
//         .insertItem({'name': name, 'description': description});
//     fetchItems();
//   }

//   Future<void> updateItem(int id, String name, String description) async {
//     await DatabaseHelper().updateItem(id, name, description);
//     fetchItems();
//   }

//   Future<void> deleteItem(int id) async {
//     await DatabaseHelper().deleteItem(id);
//     fetchItems();
//   }
// }

// // إنشاء Provider باستخدام Riverpod
// final itemProvider = StateNotifierProvider<ItemNotifier, List<Item>>((ref) {
//   return ItemNotifier();
// });
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:med_reminder/database_helper.dart';

// إنشاء نوع من البيانات (Item)
class Item {
  final int? id;
  final String name;
  final String description;

  Item({this.id, required this.name, required this.description});
}

// حالة التحميل
class ItemState {
  final List<Item> items;
  final bool isLoading;

  ItemState({required this.items, required this.isLoading});
}

// إنشاء Provider مع حالة التحميل
class ItemNotifier extends StateNotifier<ItemState> {
  ItemNotifier() : super(ItemState(items: [], isLoading: false));

  Future<void> fetchItems() async {
    state = ItemState(items: state.items, isLoading: true); // بدء التحميل
    final itemsData = await DatabaseHelper().getItems();
    state = ItemState(
      items: itemsData
          .map((item) => Item(
                id: item['id'],
                name: item['name'],
                description: item['description'],
              ))
          .toList(),
      isLoading: false, // إنهاء التحميل
    );
  }

  Future<void> addItem(String name, String description) async {
    state = ItemState(items: state.items, isLoading: true); // بدء التحميل
    await DatabaseHelper()
        .insertItem({'name': name, 'description': description});
    await fetchItems(); // تحديث البيانات بعد الإضافة
    state = ItemState(items: state.items, isLoading: false); // إنهاء التحميل
  }

  Future<void> updateItem(int id, String name, String description) async {
    state = ItemState(items: state.items, isLoading: true); // بدء التحميل
    await DatabaseHelper().updateItem(id, name, description);
    await fetchItems(); // تحديث البيانات بعد التعديل
    state = ItemState(items: state.items, isLoading: false); // إنهاء التحميل
  }

  Future<void> deleteItem(int id) async {
    state = ItemState(items: state.items, isLoading: true); // بدء التحميل
    await DatabaseHelper().deleteItem(id);
    await fetchItems(); // تحديث البيانات بعد الحذف
    state = ItemState(items: state.items, isLoading: false); // إنهاء التحميل
  }
}

// إنشاء Provider باستخدام Riverpod
final itemProvider = StateNotifierProvider<ItemNotifier, ItemState>((ref) {
  return ItemNotifier();
});
