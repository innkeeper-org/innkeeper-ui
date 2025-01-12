import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/front_office/models/room_booking.dart';
import 'package:frontend/front_office/screens/room_booking/room_booking_detail_dialog.dart';

Function roomBookingNavigation =
    (BuildContext context, RoomBooking roomBooking) => {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      RoomBookingDialog(roomBooking: roomBooking)),
              (route) => route.isFirst)
        };
