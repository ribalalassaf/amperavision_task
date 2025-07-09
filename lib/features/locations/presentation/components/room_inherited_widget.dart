import 'package:ampera_vision_test/features/locations/domain/models/room_model.dart';
import 'package:flutter/material.dart';

class RoomModelInheritedWidget extends InheritedWidget {
  final RoomModel? roomModel;

  const RoomModelInheritedWidget({super.key, required super.child, required this.roomModel});

  static RoomModelInheritedWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<RoomModelInheritedWidget>();
  }

  @override
  bool updateShouldNotify(RoomModelInheritedWidget oldWidget) {
    return oldWidget.roomModel != roomModel;
  }
}
