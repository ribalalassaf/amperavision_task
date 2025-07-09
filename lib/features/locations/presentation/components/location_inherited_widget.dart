import 'package:ampera_vision_test/features/locations/domain/models/location_model.dart';
import 'package:flutter/material.dart';

class LocationInheritedWidget extends InheritedWidget {
  final LocationModel? locationModel;

  const LocationInheritedWidget({super.key, required super.child, required this.locationModel});

  static LocationInheritedWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<LocationInheritedWidget>();
  }

  @override
  bool updateShouldNotify(LocationInheritedWidget oldWidget) {
    return oldWidget.locationModel != locationModel;
  }
}
