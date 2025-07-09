part of 'booking_cubit.dart';

@freezed
class BookingState with _$BookingState {
  const factory BookingState.initial() = _Initial;
  const factory BookingState.inProgress() = _InProgress;
  const factory BookingState.success(List<SlotViewModel> slots) = _Success;
  const factory BookingState.failure() = _Failure;
}
