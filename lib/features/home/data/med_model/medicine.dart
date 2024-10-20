class Medicine {
  final int? id;
  final String name;
  final String typeMedicine;
  final String frequency;
  final String schedule;
  final DateTime time;
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
      'frequency': frequency,
      'schedule': schedule,
      'time': time.millisecondsSinceEpoch,
      'note': note,
    };
  }

  factory Medicine.fromMap(Map<String, dynamic> map) {
    return Medicine(
      id: map['id'],
      name: map['name'],
      typeMedicine: map['typeMedicine'],
      frequency: map['frequency'],
      schedule: map['schedule'],
      time: DateTime.fromMillisecondsSinceEpoch(map['time']),
      note: map['note'],
    );
  }
}
