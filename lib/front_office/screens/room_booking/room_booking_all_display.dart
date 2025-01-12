import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/front_office/screens/room_booking/widgets/room_booking_calendar_view.dart';
import 'package:frontend/front_office/screens/room_booking/widgets/room_booking_list_view.dart';

class RoomBookingDisplay extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RoomBookingDisplayState();
}

class _RoomBookingDisplayState extends State<RoomBookingDisplay> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return CalendarViewWidget();
    Container(
        child: DefaultTabController(
            length: 2,
            initialIndex: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TabBar(tabs: <Widget>[
                  Tab(text: "Calendar View", icon: Icon(Icons.info)),
                  Tab(text: "List View", icon: Icon(Icons.list))
                ]),
                Expanded(
                    child: TabBarView(children: <Widget>[
                  CalendarViewWidget(),
                ])),
              ],
            )));
  }
}
