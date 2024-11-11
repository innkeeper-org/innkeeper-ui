import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/front_office/models/room.dart';

class RoomStatusCard extends StatelessWidget {

  // static const List<String> roomList = [ "301", "302", "303", "304", "305", "306", "307"];

  final Room room;

  const RoomStatusCard({super.key, required this.room});
  Color getCardColor() {
    switch(room.status) {

      case RoomStatus.BOOKED:
        return Colors.blueGrey;
      case RoomStatus.BLOCKED:
        return Colors.black12;
      case RoomStatus.CLEANING:
        return Colors.yellowAccent;
      case RoomStatus.CHECKED_IN:
        return Colors.blue;
      case RoomStatus.READY:
      default:
        return Colors.green;
    }
  }
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
        width: 200,
        height: 200,
        padding: EdgeInsets.all(20),
        child: Card(
          color: getCardColor(),
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
        ));

  }
  
}