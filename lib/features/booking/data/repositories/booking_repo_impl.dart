import 'package:injectable/injectable.dart';
import 'package:ampera_vision_test/features/booking/data/datasource/booking_ds.dart';
import 'package:ampera_vision_test/features/booking/domain/models/booking_model.dart';
import 'package:ampera_vision_test/features/booking/domain/repositories/booking_repo.dart';
import 'package:ampera_vision_test/utils/base_api_repository.dart';
import 'package:ampera_vision_test/utils/data_state.dart';

@LazySingleton(as: BookingRepo)
class BookingRepoImpl extends BaseApiRepository implements BookingRepo {
  final BookingDs _bookingDs;
  BookingRepoImpl(this._bookingDs);
  @override
  Future<DataState<List<BookingModel>>> getRoomBooking(String roomId) async {
    return sendRequest(request: _bookingDs.getRoomBooking(roomId));
  }
}
