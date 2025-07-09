import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BookingDetailsDialog extends StatelessWidget {
  final String locationName;
  final String roomName;
  final DateTime start;
  final DateTime end;

  const BookingDetailsDialog({
    super.key,
    required this.locationName,
    required this.roomName,
    required this.start,
    required this.end,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Booking Details'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Location: $locationName'),
          Text('Room: $roomName'),
          Text('Start: ${DateFormat('HH:mm').format(start)}'),
          Text('End: ${DateFormat('HH:mm').format(end)}'),
        ],
      ),
      actions: [
        TextButton(onPressed: () => context.maybePop(true), child: const Text('Confirm')),
        TextButton(onPressed: () => context.maybePop(), child: const Text('Close')),
      ],
    );
  }
}
