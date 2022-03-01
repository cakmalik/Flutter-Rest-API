class Presence {
  int? id;
  int? teacherId;
  String? timeIn;
  String? timeOut;
  String? late;
  String? overtime;
  String? note;

  Presence({
    this.id,
    this.teacherId,
    this.timeIn,
    this.timeOut,
    this.late,
    this.overtime,
    this.note,
  });

  factory Presence.fromJson(Map<String, dynamic> json) {
    return Presence(
      id: json['id'],
      teacherId: json['teacherId'],
      timeIn: json['timeIn'],
      timeOut: json['timeOut'],
      late: json['late'],
      overtime: json['overtime'],
      note: json['note'],
    );
  }
}
