import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:ampera_vision_test/features/booking/domain/models/booking_model.dart';
import 'package:ampera_vision_test/features/booking/domain/models/slot_view_model.dart';
import 'package:ampera_vision_test/features/booking/domain/repositories/booking_repo.dart';

part 'booking_state.dart';
part 'booking_cubit.freezed.dart';

@injectable
class BookingCubit extends Cubit<BookingState> {
  final BookingRepo _bookingRepo;
  BookingCubit(this._bookingRepo) : super(BookingState.initial());

  void getRoomSlots(String roomId, DateTime selectedDate) async {
    emit(BookingState.inProgress());
    final dataState = await _bookingRepo.getRoomBooking(roomId);
    if (dataState.isSuccess()) {
      final roomBookings = dataState.data!;
      final DateTime start = DateTime(selectedDate.year, selectedDate.month, selectedDate.day, 6, 0);
      final DateTime end = DateTime(selectedDate.year, selectedDate.month, selectedDate.day, 22, 0);
      final List<DateTime> timeSlots = [];
      DateTime current = start;
      while (current.isBefore(end)) {
        timeSlots.add(current);
        current = current.add(Duration(minutes: 15));
      }
      final List<SlotViewModel> slots = [];
      for (int i = 0; i < timeSlots.length; i++) {
        for (BookingModel booking in roomBookings) {
          if (timeSlots[i].minute == booking.start!.minute &&
              timeSlots[i].hour == booking.start!.hour &&
              timeSlots[i].day == booking.start!.day &&
              timeSlots[i].month == booking.start!.month &&
              timeSlots[i].year == booking.start!.year) {
            slots.add(
              SlotViewModel(
                start: booking.start!,
                end: booking.end!,
                durationSlots: (booking.end!.difference(booking.start!).inMinutes / 15).toInt(),
                isReserved: true,
                course: booking.course,
              ),
            );
            i = i + (booking.end!.difference(booking.start!).inMinutes / 15).toInt() - 1;
          } else {
            slots.add(
              SlotViewModel(
                start: timeSlots[i],
                end: timeSlots[i].add(Duration(minutes: 15)),
                durationSlots: 1,
                isReserved: false,
              ),
            );
          }
        }
      }
      emit(BookingState.success(slots));
    } else {
      emit(const BookingState.failure());
    }
  }
}
