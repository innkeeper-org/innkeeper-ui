
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/front_office/models/room_booking.dart';
import 'package:frontend/front_office/screens/room_booking/room_booking_dialog.dart';

Function roomBookingNavigation = (BuildContext context, RoomBooking roomBooking) => {
  Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>
          RoomBookingDialog(roomBooking: roomBooking))
  )
};