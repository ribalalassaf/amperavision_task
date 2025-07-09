import 'package:ampera_vision_test/features/booking/domain/models/booking_model.dart';
import 'package:ampera_vision_test/utils/data_state.dart';

abstract class BookingRepo {
  Future<DataState<List<BookingModel>>> getRoomBooking(String roomId);
}
