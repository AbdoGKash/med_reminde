// class Medicine {
//   final int? id;
//   final String name;
//   final String typeMedicine;
//   final String frequency;
//   final String schedule;
//   final DateTime time;
//   final String note;

//   Medicine({
//     this.id,
//     required this.name,
//     required this.typeMedicine,
//     required this.frequency,
//     required this.schedule,
//     required this.time,
//     required this.note,
//   });

//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'name': name,
//       'typeMedicine': typeMedicine,
//       'frequency': frequency,
//       'schedule': schedule,
//       'time': time.millisecondsSinceEpoch,
//       'note': note,
//     };
//   }

//   factory Medicine.fromMap(Map<String, dynamic> map) {
//     return Medicine(
//       id: map['id'],
//       name: map['name'],
//       typeMedicine: map['typeMedicine'],
//       frequency: map['frequency'],
//       schedule: map['schedule'],
//       time: DateTime.fromMillisecondsSinceEpoch(map['time']),
//       note: map['note'],
//     );
//   }
// }
class Medicine {
  final int? id;
  final String name;
  final String typeMedicine;
  final List<String> frequency;
  final List<String> schedule;
  final List<DateTime> time; // قائمة من DateTime
  final String note;

  Medicine({
    this.id,
    required this.name,
    required this.typeMedicine,
    required this.frequency,
    required this.schedule,
    required this.time,
    required this.note,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'typeMedicine': typeMedicine,
      'frequency': frequency.join(','), // تخزين القيم كـ String مفصولة بفواصل
      'schedule': schedule.join(','), // تخزين القيم كـ String مفصولة بفواصل
      'time': time
          .map((t) => t.millisecondsSinceEpoch)
          .toList(), // تخزين timestamps كسلسلة مفصولة بفواصل
      'note': note,
    };
  }

  factory Medicine.fromMap(Map<String, dynamic> map) {
    return Medicine(
      id: map['id'],
      name: map['name'],
      typeMedicine: map['typeMedicine'],
      frequency: map['frequency'].split(','), // تحويل السلسلة إلى قائمة
      schedule: map['schedule'].split(','), // تحويل السلسلة إلى قائمة
      time: List<DateTime>.from(map['time']
          .map((timestamp) => DateTime.fromMillisecondsSinceEpoch(timestamp))),
      note: map['note'],
    );
  }
}
