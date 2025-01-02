import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/front_office/models/room_booking.dart';
import 'package:frontend/front_office/repository/room_booking_repository.dart';
import 'package:logging/logging.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarViewWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CalendarViewWidgetState();
}

class _CalendarViewWidgetState extends State<CalendarViewWidget> {
  Logger logger = Logger((CalendarViewWidget).toString());


  DateTime _focusedDay = DateTime.now();
  DateTime _firstDay = DateTime.utc(2000, 06, 10);
  DateTime _lastDay = DateTime.utc(2100, 06, 10);
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  _CalendarViewWidgetState() {
    _selectedDay = _focusedDay;
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Scaffold(
      body:
           SfCalendar(
            view: CalendarView.week,
            allowedViews:  CalendarView.values,
            dataSource: EventDataSource(_getEventsFromRoomBookings(RoomBookingRepository.getRandomBookings())),
            monthViewSettings: const MonthViewSettings(
                appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
            appointmentDisplayCount: 3,
            // showAgenda: true,
            agendaViewHeight: 400
            ),
            onTap: calendarTapped,
          ),

    );
    // TODO: implement build
    //   return Container(
    //     child: TableCalendar<_Event>(
    //       calendarStyle: calendarStyle,
    //       focusedDay: _focusedDay,
    //       firstDay: _firstDay,
    //       lastDay: _lastDay,
    //       rangeSelectionMode: _rangeSelectionMode,
    //       calendarFormat: _calendarFormat,
    //       eventLoader: (day) => _getEventsFromRoomBookings(RoomBookingRepository.getRandomBookings()),
    //       selectedDayPredicate: (day) => isSameDay(day, _selectedDay),
    //       onDaySelected: (selectedDay, focusedDay) {
    //         if (!isSameDay(_selectedDay, selectedDay)) {
    //           setState(() {
    //             logger.info("Selected Day : $selectedDay, Focused Day : $focusedDay");
    //             _selectedDay = selectedDay;
    //             _focusedDay = focusedDay;
    //             _rangeStart = null; // Important to clean those
    //             _rangeEnd = null;
    //             _rangeSelectionMode = RangeSelectionMode.toggledOff;
    //           });
    //         }
    //       },
    //       onRangeSelected: (start, end, focusedDay) {
    //         setState(() {
    //           _selectedDay = null;
    //           _focusedDay = focusedDay;
    //           _rangeStart = start;
    //           _rangeEnd = end;
    //           _rangeSelectionMode = RangeSelectionMode.toggledOn;
    //         });
    //       },
    //       onFormatChanged: (format) {
    //         logger.info("Changing calendar format to $format");
    //         if (_calendarFormat != format) {
    //           setState(() {
    //             _calendarFormat = format;
    //           });
    //         }
    //       },
    //       onPageChanged: (focusedDay) {
    //         _focusedDay = focusedDay;
    //       },
    //   ));
  }

  void calendarTapped(CalendarTapDetails tapDetails) {
    // if(tapDetails.targetElement == CalendarElement.appointment ||
    // tapDetails.targetElement == CalendarElement.calendarCell) {
      logger.info("Event Tapped : " + tapDetails.appointments.toString());
    // }

  }
  _getEventsFromRoomBookings(List<RoomBooking> randomBookings) {
    List<Event> eventList = [];
    for(RoomBooking roomBooking in randomBookings) {
      final guest = roomBooking.guest;
      if(guest != null) {
        eventList.add(Event(guest.name, roomBooking.bookingCheckIn, roomBooking.bookingCheckOut, roomBooking.getRoomStatusColor()));
      }
    }
    return eventList;
  }

}

class EventDataSource extends CalendarDataSource {
  Logger logger = Logger((EventDataSource).toString());
  EventDataSource(List<Event> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    return appointments![index].title;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }
}

class Event {
  final String title;
  final DateTime from;
  final DateTime to;
  Color? background;
  bool? isAllDay;
  Event(this.title, this.from, this.to, this.background) {
    isAllDay = true;
  }
  @override
  String toString() => title;
}