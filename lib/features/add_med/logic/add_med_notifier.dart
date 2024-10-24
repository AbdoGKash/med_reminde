import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// إنشاء StateNotifier لإدارة جميع القيم المطلوبة
class AddMedNotifier extends StateNotifier<AppState> {
  AddMedNotifier() : super(AppState());
  TextEditingController noteTextController = TextEditingController();
  TextEditingController nameTextController = TextEditingController();
  // تحديث قائمة selectedItems
  void updateFrequency(List<String> newFrequency) {
    state = state.copyWith(frequencyItems: newFrequency);
  }

  // تحديث noteText
  void updateNoteText() {
    state = state.copyWith(noteText: noteTextController.text);
  }

  void updateNameText() {
    state = state.copyWith(nameText: nameTextController.text);
  }
  // تحديث قائمة scheduleItems

  void updateScheduleItems(List<String> newSchedule) {
    state = state.copyWith(scheduleItems: newSchedule);
  }

  void addSelectedTime(TimeOfDay time) {
    state = state.copyWith(
      selectedTimes: [...state.selectedTimes, time],
    );
  }

  void removeSelectedTime(TimeOfDay time) {
    state = state.copyWith(
      selectedTimes: state.selectedTimes.where((t) => t != time).toList(),
    );
  }

  // تحديث قائمة selectedTimes
  void updateSelectedTimes(List<TimeOfDay> newTimes) {
    state = state.copyWith(selectedTimes: newTimes);
  }

  // تحديث قائمة typeMedicineItems
  void updateTypeMedicineItems(List<String> newTypes) {
    state = state.copyWith(typeMedicineItems: newTypes);
  }

  @override
  void dispose() {
    noteTextController.dispose(); // تحرير الذاكرة
    super.dispose();
  }
}

// الحالة التي تدير جميع القيم
class AppState {
  final List<String> frequencyItems;
  final String noteText;
  final String nameText;
  final List<String> scheduleItems;
  final List<TimeOfDay> selectedTimes;
  final List<String> typeMedicineItems;

  AppState({
    this.frequencyItems = const [],
    this.noteText = '',
    this.nameText = '',
    this.scheduleItems = const [],
    this.selectedTimes = const [],
    this.typeMedicineItems = const [],
  });

  // إنشاء نسخة جديدة من AppState مع القيم الجديدة
  AppState copyWith({
    List<String>? frequencyItems,
    String? noteText,
    String? nameText,
    List<String>? scheduleItems,
    List<TimeOfDay>? selectedTimes,
    List<String>? typeMedicineItems,
  }) {
    return AppState(
      frequencyItems: frequencyItems ?? this.frequencyItems,
      noteText: noteText ?? this.noteText,
      nameText: nameText ?? this.nameText,
      scheduleItems: scheduleItems ?? this.scheduleItems,
      selectedTimes: selectedTimes ?? this.selectedTimes,
      typeMedicineItems: typeMedicineItems ?? this.typeMedicineItems,
    );
  }
}

// إنشاء المزود باستخدام StateNotifierProvider
final addMedProvider = StateNotifierProvider<AddMedNotifier, AppState>((ref) {
  return AddMedNotifier();
});
