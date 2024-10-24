// import 'package:med_reminder/features/home/data/med_model/medicine.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';

// class DatabaseHelper {
//   static final DatabaseHelper _instance = DatabaseHelper._internal();
//   factory DatabaseHelper() => _instance;

//   DatabaseHelper._internal();

//   static Database? _database;

//   Future<Database> get database async {
//     if (_database != null) return _database!;
//     _database = await _initDatabase();
//     return _database!;
//   }

//   Future<Database> _initDatabase() async {
//     try {
//       String path = join(await getDatabasesPath(), 'medicine.db');
//       return await openDatabase(
//         path,
//         version: 1,
//         onCreate: (db, version) async {
//           await db.execute('''
//           CREATE TABLE medicines (
//             id INTEGER PRIMARY KEY AUTOINCREMENT,
//             name TEXT,
//             typeMedicine TEXT,
//             frequency TEXT,
//             schedule TEXT,
//             time INTEGER,
//             note TEXT
//           )
//         ''');
//         },
//       );
//     } catch (e) {
//       print('Error initializing database: $e');
//       rethrow;
//     }
//   }

//   // إضافة دواء جديد باستخدام كائن Medicine
//   Future<int> insertMedicine(Medicine medicine) async {
//     try {
//       final db = await database;
//       return await db.insert('medicines', medicine.toMap());
//     } catch (e) {
//       print('Error inserting medicine: $e');
//       return -1; // يمكن إعادة -1 أو أي رمز يدل على الفشل
//     }
//   }

//   // جلب كل الأدوية وتحويلها إلى قائمة من كائنات Medicine
//   Future<List<Medicine>> getMedicines() async {
//     try {
//       final db = await database;
//       final List<Map<String, dynamic>> medicinesData =
//           await db.query('medicines');
//       return medicinesData.map((map) => Medicine.fromMap(map)).toList();
//     } catch (e) {
//       print('Error fetching medicines: $e');
//       return []; // إعادة قائمة فارغة في حالة حدوث خطأ
//     }
//   }

//   // تحديث دواء
//   Future<int> updateMedicine(Medicine medicine) async {
//     try {
//       final db = await database;
//       return await db.update('medicines', medicine.toMap(),
//           where: 'id = ?', whereArgs: [medicine.id]);
//     } catch (e) {
//       print('Error updating medicine: $e');
//       return -1; // يمكن إعادة -1 أو أي رمز يدل على الفشل
//     }
//   }

//   // حذف دواء
//   Future<int> deleteMedicine(int id) async {
//     try {
//       final db = await database;
//       return await db.delete('medicines', where: 'id = ?', whereArgs: [id]);
//     } catch (e) {
//       print('Error deleting medicine: $e');
//       return -1; // يمكن إعادة -1 أو أي رمز يدل على الفشل
//     }
//   }
// }
import 'package:med_reminder/features/home/data/med_model/medicine.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    try {
      String path = join(await getDatabasesPath(), 'medicine.db');
      return await openDatabase(
        path,
        version: 1,
        onCreate: (db, version) async {
          await db.execute('''
          CREATE TABLE medicines (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            typeMedicine TEXT,
            frequency TEXT,
            schedule TEXT,
            time INTEGER,
            note TEXT
          )
        ''');
        },
      );
    } catch (e) {
      print('Error initializing database: $e');
      rethrow;
    }
  }

  // إضافة دواء جديد باستخدام كائن Medicine
  Future<int> insertMedicine(Medicine medicine) async {
    try {
      final db = await database;
      return await db.insert('medicines', medicine.toMap());
    } catch (e) {
      print('Error inserting medicine: $e');
      return -1; // يمكن إعادة -1 أو أي رمز يدل على الفشل
    }
  }

  // جلب كل الأدوية وتحويلها إلى قائمة من كائنات Medicine
  Future<List<Medicine>> getMedicines() async {
    try {
      final db = await database;
      final List<Map<String, dynamic>> medicinesData =
          await db.query('medicines');
      return medicinesData.map((map) => Medicine.fromMap(map)).toList();
    } catch (e) {
      print('Error fetching medicines: $e');
      return []; // إعادة قائمة فارغة في حالة حدوث خطأ
    }
  }

  // تحديث دواء
  Future<int> updateMedicine(Medicine medicine) async {
    try {
      final db = await database;
      return await db.update('medicines', medicine.toMap(),
          where: 'id = ?', whereArgs: [medicine.id]);
    } catch (e) {
      print('Error updating medicine: $e');
      return -1; // يمكن إعادة -1 أو أي رمز يدل على الفشل
    }
  }

  // حذف دواء
  Future<int> deleteMedicine(int id) async {
    try {
      final db = await database;
      return await db.delete('medicines', where: 'id = ?', whereArgs: [id]);
    } catch (e) {
      print('Error deleting medicine: $e');
      return -1; // يمكن إعادة -1 أو أي رمز يدل على الفشل
    }
  }
}
