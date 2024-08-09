import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:samay_admin_plan/models/salon_form_models/salon_infor_model.dart';
import 'package:samay_admin_plan/utility/color.dart';
import 'package:samay_admin_plan/utility/dimenison.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomCalendar extends StatefulWidget {
  final SalonModel salonModel;
  final TextEditingController controller;
  final DateTime initialDate;
  final ValueChanged<DateTime> onDateChanged;

  const CustomCalendar({
    Key? key,
    required this.salonModel,
    required this.controller,
    required this.initialDate,
    required this.onDateChanged,
  }) : super(key: key);

  @override
  State<CustomCalendar> createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  DateTime _selectedDate = DateTime.now(); // Track selected date
  List<String> _closedDays = []; // List of closed days

  @override
  void initState() {
    super.initState();
    // Initialize the selected date to the initial date passed in
    _selectedDate = widget.initialDate;
    // Find which days the salon is closed
    _findClosedDays();
  }

  // Find the salon's closed days based on the model
  void _findClosedDays() {
    _closedDays.clear();
    if (widget.salonModel.monday?.toLowerCase() == 'close') {
      _closedDays.add('Monday');
    }
    if (widget.salonModel.tuesday?.toLowerCase() == 'close') {
      _closedDays.add('Tuesday');
    }
    if (widget.salonModel.wednesday?.toLowerCase() == 'close') {
      _closedDays.add('Wednesday');
    }
    if (widget.salonModel.thursday?.toLowerCase() == 'close') {
      _closedDays.add('Thursday');
    }
    if (widget.salonModel.friday?.toLowerCase() == 'close') {
      _closedDays.add('Friday');
    }
    if (widget.salonModel.saturday?.toLowerCase() == 'close') {
      _closedDays.add('Saturday');
    }
    if (widget.salonModel.sunday?.toLowerCase() == 'close') {
      _closedDays.add('Sunday');
    }
  }

  // Check if the salon is closed on a given date
  bool _isSalonClosed(DateTime date) {
    switch (date.weekday) {
      case DateTime.monday:
        return widget.salonModel.monday?.toLowerCase() == 'close';
      case DateTime.tuesday:
        return widget.salonModel.tuesday?.toLowerCase() == 'close';
      case DateTime.wednesday:
        return widget.salonModel.wednesday?.toLowerCase() == 'close';
      case DateTime.thursday:
        return widget.salonModel.thursday?.toLowerCase() == 'close';
      case DateTime.friday:
        return widget.salonModel.friday?.toLowerCase() == 'close';
      case DateTime.saturday:
        return widget.salonModel.saturday?.toLowerCase() == 'close';
      case DateTime.sunday:
        return widget.salonModel.sunday?.toLowerCase() == 'close';
      default:
        return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimensions.dimenisonNo5),
      decoration: BoxDecoration(
        color: const Color.fromARGB(
            255, 179, 250, 182), // Background color for the calendar
        borderRadius: BorderRadius.circular(Dimensions.dimenisonNo20),
      ),
      child: TableCalendar(
        focusedDay: _selectedDate,
        firstDay: DateTime(2023),
        lastDay: DateTime(2030),
        holidayPredicate: _isSalonClosed,
        selectedDayPredicate: (day) => isSameDay(_selectedDate, day),
        onDaySelected: (selectedDay, focusedDay) {
          if (_isSalonClosed(selectedDay)) {
            // Show a dialog if the selected date is a closed day
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('Weekday Holiday'),
                content: Text('The salon is closed on the selected date.'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('OK'),
                  ),
                ],
              ),
            );
          } else {
            // Update the selected date and notify the parent widget
            setState(() {
              _selectedDate = selectedDay;
              widget.controller.text =
                  DateFormat('dd MMMM').format(_selectedDate);
              widget.onDateChanged(_selectedDate);
            });
          }
        },
        calendarBuilders: CalendarBuilders(
          holidayBuilder: (context, date, _) => Center(
            child: Container(
              margin: EdgeInsets.all(Dimensions.dimenisonNo5),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red, // Color for holidays
              ),
              child: Center(
                child: Text(
                  date.day.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          selectedBuilder: (context, date, events) => Center(
            child: Container(
              margin: const EdgeInsets.all(4.0),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.buttonColor, // Color for selected day
              ),
              child: Center(
                child: Text(
                  date.day.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
