import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String formatISO8601() => DateFormat("yyyy-MM-dd").format(this);
  String formatBritishIso() => DateFormat("dd MMM yyyy").format(this);

  List<DateTime> getFollowingAndPreviousDates() {
    return [
      subtract(const Duration(days: 4)),
      subtract(const Duration(days: 3)),
      subtract(const Duration(days: 2)),
      subtract(const Duration(days: 1)),
      this,
      add(const Duration(days: 1)),
      add(const Duration(days: 2)),
      add(const Duration(days: 3)),
      add(const Duration(days: 4)),
    ];
  }

  // ignore: non_constant_identifier_names
  String EEEDMMMOrName() {
    if (year == DateTime.now().year && month == DateTime.now().month && day == DateTime.now().day) {
      return "today";
    }
    if (year == DateTime.now().year && month == DateTime.now().month && day == DateTime.now().day - 1) {
      return "yesterday";
    }
    if (year == DateTime.now().year && month == DateTime.now().month && day == DateTime.now().day + 1) {
      return "tomorrow";
    }

    return DateFormat("dd.MM.yyyy").format(this);
  }
}

extension ListsExtension<T> on Iterable<T>? {
  bool isEmptyOrNull() {
    return this == null || this!.isEmpty;
  }

  bool isNotEmptyOrNull() {
    return this != null && this!.isNotEmpty;
  }

  T? firstWhereOrNull(bool Function(T element) test) {
    if (this == null) return null;
    for (var element in this!) {
      if (test(element)) return element;
    }
    return null;
  }
}
