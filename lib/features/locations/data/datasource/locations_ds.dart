import 'package:injectable/injectable.dart';
import 'package:ampera_vision_test/features/locations/domain/models/location_model.dart';

@LazySingleton()
class LocationsDs {
  Future<List<LocationModel>> getLocations() async {
    final data = [
      {
        "id": "loc_1",
        "name": "Downtown Gym",
        "rooms": [
          {"id": "room_1", "name": "Studio A"},
          {"id": "room_2", "name": "Court 1"},
        ],
      },
      {
        "id": "loc_2",
        "name": "Riverside Gym",
        "rooms": [
          {"id": "room_3", "name": "Spin Room"},
        ],
      },
    ];
    await Future.delayed(Duration(seconds: 2));
    return List<LocationModel>.from(data.map((element) => LocationModel.fromJson(element)));
  }
}
