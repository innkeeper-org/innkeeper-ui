import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/front_office/models/room_booking.dart';
import 'package:frontend/front_office/navigations/index.dart';
import 'package:frontend/front_office/repository/room_booking_repository.dart';
import 'package:frontend/front_office/screens/room_booking/room_booking_dialog.dart';
import 'package:logging/logging.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarViewWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CalendarViewWidgetState();
}

class _CalendarViewWidgetState extends State<CalendarViewWidget> {
  Logger logger = Logger((CalendarViewWidget).toString());




  _CalendarViewWidgetState() {

  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Scaffold(
      body:
           SfCalendar(
            view: CalendarView.week,
            allowedViews:  CalendarView.values,
            dataSource: RoomBookingDataSource(RoomBookingRepository.getRandomBookings()),
            monthViewSettings: const MonthViewSettings(
                appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
            appointmentDisplayCount: 3,
            // showAgenda: true,
            agendaViewHeight: 400
            ),
            onTap: calendarTapped,
          ),

    );
  }

  void calendarTapped(CalendarTapDetails tapDetails) {
    // if(tapDetails.targetElement == CalendarElement.appointment ||
    // tapDetails.targetElement == CalendarElement.calendarCell) {
      logger.info("Event Tapped : " + tapDetails.appointments.toString());
      // tapDetails.appointments
      switch(tapDetails.targetElement) {
        case CalendarElement.appointment:
          RoomBooking roomBooking = tapDetails.appointments![0];
          roomBookingNavigation(context, roomBooking);
          break;
        default:
          logger.info("Navigation not implemented");
      }
  }

}

class RoomBookingDataSource extends CalendarDataSource {
  Logger logger = Logger((RoomBooking).toString());
  RoomBookingDataSource(List<RoomBooking> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].bookingCheckIn;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].bookingCheckOut;
  }

  @override
  String getSubject(int index) {
    return appointments![index].guest.name;
  }

  @override
  Color getColor(int index) {
    return appointments![index].getRoomStatusColor();
  }

  @override
  bool isAllDay(int index) {
    return true;
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