class BookingModel {
  final String? roomId;
  final String? course;
  final DateTime? start;
  final DateTime? end;

  BookingModel({this.roomId, this.course, this.start, this.end});

  factory BookingModel.fromJson(Map<String, dynamic> json) => BookingModel(
    roomId: json["roomId"],
    course: json["course"],
    start: json["start"] == null ? null : DateTime.parse(json["start"]),
    end: json["end"] == null ? null : DateTime.parse(json["end"]),
  );
}
