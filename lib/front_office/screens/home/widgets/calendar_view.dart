import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/front_office/models/room_booking.dart';
import 'package:frontend/front_office/repository/room_booking_repository.dart';
import 'package:logging/logging.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  Logger logger = Logger((CalendarView).toString());
  CalendarFormat _calendarFormat = CalendarFormat.month;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode
      .toggledOn; // Can be toggled on/off by longpressing a date
  DateTime _focusedDay = DateTime.now();
  DateTime _firstDay = DateTime.utc(2000, 06, 10);
  DateTime _lastDay = DateTime.utc(2100, 06, 10);
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  _CalendarViewState() {
    _selectedDay = _focusedDay;
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    CalendarStyle calendarStyle = new CalendarStyle(
        selectedTextStyle: theme.primaryTextTheme.bodyMedium!,
    );

    // TODO: implement build
      return Container(
        child: TableCalendar<_Event>(
          calendarStyle: calendarStyle,
          focusedDay: _focusedDay,
          firstDay: _firstDay,
          lastDay: _lastDay,
          rangeSelectionMode: _rangeSelectionMode,
          calendarFormat: _calendarFormat,
          eventLoader: (day) => _getEventsFromRoomBookings(RoomBookingRepository.getRandomBookings()),
          selectedDayPredicate: (day) => isSameDay(day, _selectedDay),
          onDaySelected: (selectedDay, focusedDay) {
            if (!isSameDay(_selectedDay, selectedDay)) {
              setState(() {
                logger.info("Selected Day : $selectedDay, Focused Day : $focusedDay");
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
                _rangeStart = null; // Important to clean those
                _rangeEnd = null;
                _rangeSelectionMode = RangeSelectionMode.toggledOff;
              });
            }
          },
          onRangeSelected: (start, end, focusedDay) {
            setState(() {
              _selectedDay = null;
              _focusedDay = focusedDay;
              _rangeStart = start;
              _rangeEnd = end;
              _rangeSelectionMode = RangeSelectionMode.toggledOn;
            });
          },
          onFormatChanged: (format) {
            logger.info("Changing calendar format to $format");
            if (_calendarFormat != format) {
              setState(() {
                _calendarFormat = format;
              });
            }
          },
          onPageChanged: (focusedDay) {
            _focusedDay = focusedDay;
          },
      ));
  }
  _getEventsFromRoomBookings(List<RoomBooking> randomBookings) {
    List<_Event> eventList = [];
    for(RoomBooking roomBooking in randomBookings) {
      final guest = roomBooking.guest;
      if(guest != null) {
        eventList.add(_Event(guest.name));
      }
    }
    return eventList;
  }

}


class _Event {
  final String title;
  const _Event(this.title);

  @override
  String toString() => title;
}