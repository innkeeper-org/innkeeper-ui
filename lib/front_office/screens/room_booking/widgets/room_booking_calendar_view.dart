import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/front_office/models/room_booking.dart';
import 'package:frontend/front_office/navigations/index.dart';
import 'package:frontend/front_office/repository/room_booking_repository.dart';
import 'package:frontend/front_office/screens/room_booking/room_booking_detail_dialog.dart';
import 'package:logging/logging.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarViewWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CalendarViewWidgetState();
}

class _CalendarViewWidgetState extends State<CalendarViewWidget> {
  Logger logger = Logger((CalendarViewWidget).toString());
  final CalendarController _calendarController = CalendarController();
  @override
  void initState() {
    // TODO: implement initState
    _calendarController.selectedDate = DateTime.now();
    _calendarController.displayDate =
        DateTime.now().add(const Duration(days: 1));
    _calendarController.view = CalendarView.month;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return SfCalendar(
      controller: _calendarController,
      allowedViews: const [
        CalendarView.day,
        CalendarView.week,
        CalendarView.month,
        CalendarView.timelineMonth
      ],
      firstDayOfWeek: 1,
      dataSource:
          RoomBookingDataSource(RoomBookingRepository.getRandomBookings()),
      monthViewSettings: const MonthViewSettings(
          appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
          appointmentDisplayCount: 3,
          // showAgenda: true,
          agendaViewHeight: 400),
      onTap: calendarTapped,
    );
  }

  void calendarTapped(CalendarTapDetails tapDetails) {
    // if(tapDetails.targetElement == CalendarElement.appointment ||
    // tapDetails.targetElement == CalendarElement.calendarCell) {
    logger.info("Event Tapped : " + tapDetails.appointments.toString());
    // tapDetails.appointments
    switch (tapDetails.targetElement) {
      case CalendarElement.appointment:
        RoomBooking roomBooking = tapDetails.appointments![0];
        roomBookingNavigation(context, roomBooking);
        break;
      case CalendarElement.calendarCell:
        _calendarController.view = CalendarView.day;
      default:
        logger.info("Navigation not implemented:" +
            tapDetails.targetElement.toString());
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
