import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/front_office/models/room.dart';
import 'package:frontend/front_office/navigations/index.dart';

class RoomStatusCard extends StatelessWidget {

  // static const List<String> roomList = [ "301", "302", "303", "304", "305", "306", "307"];

  final Room room;

  const RoomStatusCard({super.key, required this.room});
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return
      InkWell(
        onTap: room.roomBooking != null ? () => roomBookingNavigation(context, room.roomBooking) : null,
        child: Container(
        width: 200,
        height: 200,
        padding: EdgeInsets.all(5),
        child: Card(
          color: Room.getRoomStatusColor(room.status),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(room.name, style: theme.textTheme.headlineMedium),
              Expanded(
                  child: Text(room.roomBooking?.guest?.name ?? room.roomBooking?.roomBookingId ?? "")
                ),
              Divider(),
              Text(room.status.name, style: theme.textTheme.bodyMedium)
            ],
          )
        )));

  }
  
}