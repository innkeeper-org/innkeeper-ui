import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/front_office/models/guest.dart';
import 'package:frontend/front_office/models/room.dart';
import 'package:frontend/front_office/models/room_booking.dart';
import 'package:frontend/front_office/repository/room_booking_repository.dart';
import 'package:frontend/front_office/screens/room_booking/widgets/room_booking_ledger.dart';
import 'package:frontend/front_office/screens/room_booking/widgets/room_booking_overview.dart';

class RoomBookingDialog extends StatefulWidget {
  final RoomBooking roomBooking;
  const RoomBookingDialog({super.key, required this.roomBooking});

  @override
  State<StatefulWidget> createState() => _RoomBookingDialogState();

}

class _RoomBookingDialogState extends State<RoomBookingDialog> {
  

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    RoomBooking roomBooking = widget.roomBooking;
    return
      Card(
          elevation: 1,
          color: themeData.secondaryHeaderColor,
          shape: const ContinuousRectangleBorder(),
          child: DefaultTabController(length: 2,
              initialIndex: 0,
              child: Scaffold(
                appBar: AppBar(
                  title: const Text("Room Booking Details"),
                  bottom: const TabBar(
                      tabs: <Widget>[
                        Tab(text:"Overview", icon: Icon(Icons.info)),
                        Tab(text: "Billing Account", icon: Icon(Icons.list))
                      ]),
                ),
                body: TabBarView(
                    children: <Widget>[
                      RoomBookingOverview(roomBooking: roomBooking),
                      RoomBookingLedger(roomBooking: roomBooking),
                    ]),
              ))
      );
  }
}

