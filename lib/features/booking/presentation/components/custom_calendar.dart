import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalendarBottomSheet extends StatefulWidget {
  final DateTime initialDate;
  final ValueChanged<DateTime> onDateSelected;

  const CalendarBottomSheet({super.key, required this.initialDate, required this.onDateSelected});

  @override
  State<CalendarBottomSheet> createState() => _CalendarBottomSheetState();
}

class _CalendarBottomSheetState extends State<CalendarBottomSheet> {
  late DateTime _displayedMonth;
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initialDate;
    _displayedMonth = DateTime(widget.initialDate.year, widget.initialDate.month);
  }

  List<Widget> _buildCalendarDays() {
    final firstDayOfMonth = DateTime(_displayedMonth.year, _displayedMonth.month, 1);
    final daysInMonth = DateUtils.getDaysInMonth(_displayedMonth.year, _displayedMonth.month);
    final startWeekday = firstDayOfMonth.weekday;
    final totalCells = daysInMonth + (startWeekday - 1);

    return List.generate(totalCells, (index) {
      if (index < startWeekday - 1) {
        return SizedBox();
      } else {
        int day = index - (startWeekday - 2);
        final date = DateTime(_displayedMonth.year, _displayedMonth.month, day);
        final isSelected =
            _selectedDate.year == date.year && _selectedDate.month == date.month && _selectedDate.day == date.day;

        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedDate = date;
            });
            widget.onDateSelected(date);
          },
          child: Container(
            decoration: BoxDecoration(color: isSelected ? Colors.blue : Colors.transparent, shape: BoxShape.circle),
            alignment: Alignment.center,
            child: Text(
              "$day",
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      height: 400,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DropdownButton<int>(
                value: _displayedMonth.month,
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      _displayedMonth = DateTime(_displayedMonth.year, value, 1);
                    });
                  }
                },
                items: List.generate(12, (index) {
                  final month = index + 1;
                  return DropdownMenuItem(value: month, child: Text(DateFormat.MMMM().format(DateTime(0, month))));
                }),
              ),

              DropdownButton<int>(
                value: _displayedMonth.year,
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      _displayedMonth = DateTime(value, _displayedMonth.month, 1);
                    });
                  }
                },
                items: List.generate(50, (index) {
                  final year = DateTime.now().year - 25 + index;
                  return DropdownMenuItem(value: year, child: Text("$year"));
                }),
              ),

              TextButton(
                onPressed: () {
                  setState(() {
                    final today = DateTime.now();
                    _displayedMonth = DateTime(today.year, today.month);
                    _selectedDate = today;
                  });
                  widget.onDateSelected(DateTime.now());
                },
                child: Text("Today"),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children:
                ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
                    .map(
                      (day) => Expanded(child: Center(child: Text(day, style: TextStyle(fontWeight: FontWeight.bold)))),
                    )
                    .toList(),
          ),
          SizedBox(height: 10),
          Expanded(child: GridView.count(crossAxisCount: 7, children: _buildCalendarDays())),
        ],
      ),
    );
  }
}
