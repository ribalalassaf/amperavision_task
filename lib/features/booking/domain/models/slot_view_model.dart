class SlotViewModel {
  final DateTime start;
  final DateTime end;
  final int durationSlots;
  final String? course;
  final bool isReserved;

  SlotViewModel({required this.start, required this.end, this.durationSlots = 1, this.course, this.isReserved = false});

  bool get isBooked => course != null;
}
