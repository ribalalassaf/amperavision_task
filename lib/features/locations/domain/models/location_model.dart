import 'package:ampera_vision_test/features/locations/domain/models/room_model.dart';

class LocationModel {
  final String? id;
  final String? name;
  final List<RoomModel>? rooms;

  LocationModel({this.id, this.name, this.rooms});

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
    id: json["id"],
    name: json["name"],
    rooms: json["rooms"] == null ? [] : List<RoomModel>.from(json["rooms"]!.map((x) => RoomModel.fromJson(x))),
  );
}
