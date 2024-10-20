import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:med_reminder/features/home/data/local_database.dart/local_db.dart';
import 'package:med_reminder/features/home/data/med_model/medicine.dart';

class MedicineState {
  final List<Medicine> medicines;
  final bool isLoading;

  MedicineState({required this.medicines, required this.isLoading});
}

// إنشاء Provider مع حالة التحميل
class MedicineNotifier extends StateNotifier<MedicineState> {
  MedicineNotifier() : super(MedicineState(medicines: [], isLoading: false));

  Future<void> fetchMedicines() async {
    state = MedicineState(
        medicines: state.medicines, isLoading: true); // بدء التحميل
    final medicinesData = await DatabaseHelper().getMedicines();
    state = MedicineState(
      medicines: medicinesData,
      isLoading: false, // إنهاء التحميل
    );
  }

  Future<void> addMedicine(Medicine medicine) async {
    state = MedicineState(
        medicines: state.medicines, isLoading: true); // بدء التحميل
    await DatabaseHelper().insertMedicine(medicine);
    await fetchMedicines(); // تحديث البيانات بعد الإضافة
    state = MedicineState(
        medicines: state.medicines, isLoading: false); // إنهاء التحميل
  }

  Future<void> updateMedicine(Medicine medicine) async {
    state = MedicineState(
        medicines: state.medicines, isLoading: true); // بدء التحميل
    await DatabaseHelper().updateMedicine(medicine);
    await fetchMedicines(); // تحديث البيانات بعد التعديل
    state = MedicineState(
        medicines: state.medicines, isLoading: false); // إنهاء التحميل
  }

  Future<void> deleteMedicine(int id) async {
    state = MedicineState(
        medicines: state.medicines, isLoading: true); // بدء التحميل
    await DatabaseHelper().deleteMedicine(id);
    await fetchMedicines(); // تحديث البيانات بعد الحذف
    state = MedicineState(
        medicines: state.medicines, isLoading: false); // إنهاء التحميل
  }
}

// إنشاء Provider باستخدام Riverpod
final medicineProvider =
    StateNotifierProvider<MedicineNotifier, MedicineState>((ref) {
  return MedicineNotifier();
});
