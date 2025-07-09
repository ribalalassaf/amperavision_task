import 'package:injectable/injectable.dart';
import 'package:ampera_vision_test/features/booking/domain/models/booking_model.dart';

@LazySingleton()
class BookingDs {
  final bookings = [
    {"roomId": "room_1", "course": "Yoga Basics", "start": "2025-07-14T09:00:00", "end": "2025-07-14T10:30:00"},
    {"roomId": "room_2", "course": "HIIT Express", "start": "2025-07-14T18:00:00", "end": "2025-07-14T19:00:00"},
    {"roomId": "room_3", "course": "Spinning Marathon", "start": "2025-07-11T12:00:00", "end": "2025-07-11T14:00:00"},
  ];
  Future<List<BookingModel>> getRoomBooking(String roomId) async {
    Future.delayed(Duration(seconds: 2));

    final matchingBookings = bookings.where((b) => b['roomId'] == roomId).map((b) => BookingModel.fromJson(b)).toList();

    return matchingBookings;
  }
}
